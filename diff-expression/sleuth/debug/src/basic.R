install.packages('tidyverse', dependencies=TRUE, type="source")
library("sleuth")
require(tidyverse)
require(purrr)
require(stringr)
#BiocInstaller::biocLite("COMBINE-lab/wasabi")
require(wasabi)

base <- file.path("/home", "rstudio", "samples")
#GSM1696274,GSM1696275,GSM1696276
#GSM1696271,GSM1696272,GSM1696273


samples <- c("GSM1696274", "GSM1696271")
quant <- "transcripts_quant"
pathes <- map_chr(samples, function(s) str_c(base, "/", s, "/", quant))
prepare_fish_for_sleuth(pathes)

conditions <- c("one", "two")

s2c = data.frame(
sample = samples,
condition = conditions,
path = pathes,
stringsAsFactors=FALSE
)
so <- sleuth_prep(s2c)

model <- 'lrt'
assembly <- "hsapiens_gene_ensembl"

mart <- biomaRt::useMart(biomart = "ENSEMBL_MART_ENSEMBL",
dataset = assembly,
host = 'ensembl.org')
t2g <- biomaRt::getBM(attributes = c("ensembl_transcript_id", "ensembl_gene_id",
"external_gene_name"), mart = mart)
t2g <- dplyr::rename(t2g, target_id = ensembl_transcript_id,
ens_gene = ensembl_gene_id, ext_gene = external_gene_name)


s2c <- read.table(file.path("data", "metadata", conditions), header = TRUE, stringsAsFactors=FALSE)
s2c <- dplyr::select(s2c, sample = run_accession, condition)
s2c <- dplyr::mutate(s2c, path = kal_dirs)
print(s2c)

# the sleuth object must first be initialized with
so <- sleuth_prep(s2c, target_mapping = t2g, extra_bootstrap_summary = TRUE)

# then the full model is fit with
so <- sleuth_fit(so, ~condition, 'full')

# the “reduced” model is fit with
so <- sleuth_fit(so, ~1, 'reduced')

# and the test is performed with
so <- sleuth_lrt(so, 'reduced', 'full')
models(so)

# the results of the test can be examined with
sleuth_table <- sleuth_results(so, 'reduced:full', model, show_all = TRUE)
#sleuth_significant <- dplyr::filter(sleuth_table, qval <= 0.05)
#head(sleuth_significant, 20)
sleuth_live(so)
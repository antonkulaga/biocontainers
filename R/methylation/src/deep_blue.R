library(DeepBlueR)
library(stringi)

deepblue_info("me")
deepblue_list_genomes()
#deepblue_list_gene_models()
vignette("DeepBlueR")

#example of search by tissue

tissue = "blood"
sources = deepblue_get_biosource_children(tissue)
#sources = deepblue_get_biosource_related(tissue)
source_names = deepblue_extract_names(sources)

samples = deepblue_list_samples(biosource = source_names)
#samples$donor_age
#samples$age
sample_ids = deepblue_extract_ids(samples)



#example of gene expressions search
exp_query <- deepblue_select_expressions(
  expression_type = "gene",
  sample_ids = sample_ids, gene_model = "gencode v23")

request_id <- deepblue_get_regions(query_id = exp_query)
regions <- deepblue_download_request_data(request_id = request_id, do_not_cache = TRUE)

deepblue_info(request_id)
regions

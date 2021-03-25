if("BiocInstaller" %in% rownames(installed.packages())) remove.packages("BiocInstaller")

to_install <- c(
  "BiocManager", # Bioconductor installer
  "devtools", #Dev tools installer
  "tidyverse", # The tidyverse is an opinionated collection of R packages designed for data science.
  "shiny", #web
  "caret",
  "plotly", #charts
  "optigrab", "optparse", "docopt" #for CLI
)
install.packages(to_install, , dependencies = TRUE)
to_install_bioconductor <- c(
    "Matrix", "KernSmooth", "mgcv", "Biostrings", "BiocGenerics", "S4Vectors",
    "devtools", "tximport", "tximeta", #for development, counts import
    "biomaRt", "AnnotationDbi", "ensembldb", "AHEnsDbs", #for annotations
    "missForest", "doParallel"
)
BiocManager::install(to_install_bioconductor)
to_install_bio <- c("DESeq2", "WGCNA", "sva")
BiocManager::install(to_install_bio)
to_install <- c("dplyr","bestNormalize","glmnet","data.table","org.Hs.eg.db","caret","MXM")
install.packages(to_install)
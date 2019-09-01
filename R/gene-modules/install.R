to_install_bio <- c("DESeq2", "WGCNA", "sva", "org.Hs.eg.db")
BiocManager::install(to_install_bio)
to_install <- c("dplyr","bestNormalize","glmnet","data.table","caret","MXM")
install.packages(to_install)
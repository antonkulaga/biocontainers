to_install <- c("tximport",
                "DeepBlueR",
                "DMRcaller",
                "LOLA",
                "MIRA",
                "methylGSA",
                "EnrichedHeatmap",
                "epihet",
                "RankProd",
                "minfi",
                "MEDIPS",
                "RUVSeq",
                "FlowSorted.Blood.450k", "minfi" #arrays
)
BiocManager::install(to_install)
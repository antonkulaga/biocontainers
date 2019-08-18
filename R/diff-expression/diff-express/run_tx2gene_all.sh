#!/usr/bin/env bash
docker run -v /data:/data quay.io/comp-bio-aging/diff-express:latest /home/rstudio/tx2gene_all.R --species /data/ensembl/97/species --output /data/ensembl/97/species/tx2gene

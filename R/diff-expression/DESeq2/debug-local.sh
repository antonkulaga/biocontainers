#!/usr/bin/env bash
docker run -e PASSWORD=nopassword -v /pipelines/samples/GSE69261,GSE69264/:/home/rstudio/samples/ -v `pwd`/data/:/home/rstudio/data/ -p 8787:8787 quay.io/comp-bio-aging/deseq2:latest

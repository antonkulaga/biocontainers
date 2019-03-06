#!/usr/bin/env bash
docker run -v ${1}:/home/rstudio/samples -p 8787:8787  -e PASSWORD=InStatsWeTrust! quay.io/comp-bio-aging/deseq2:latest

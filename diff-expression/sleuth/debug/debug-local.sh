#!/usr/bin/env bash
docker run -v /pipelines/samples/GSE36041/:/home/rstudio/samples/ -v `pwd`/data/:/home/rstudio/data/ -p 8787:8787 quay.io/comp-bio-aging/sleuth-debug:latest

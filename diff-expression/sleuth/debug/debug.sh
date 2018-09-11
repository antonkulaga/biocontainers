#!/usr/bin/env bash
docker run -v ${1}:/home/rstudio/data/ -p 8787:8787 quay.io/comp-bio-aging/sleuth-debug:latest

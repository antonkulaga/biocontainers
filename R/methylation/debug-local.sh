#!/usr/bin/env bash
docker run -e PASSWORD=nopassword -v /data/samples:/home/rstudio/samples -v /data:/data -v `pwd`/src:/home/rstudio -p 8787:8787 quay.io/comp-bio-aging/methylation:latest /init

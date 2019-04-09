#!/usr/bin/env bash
docker run -e PASSWORD=nopassword -v /data/samples:/home/rstudio/samples -v /data:/data -p 8787:8787 quay.io/comp-bio-aging/diff-express:latest

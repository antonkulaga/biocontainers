#!/usr/bin/env bash
docker run -p 8787:8787 -e PASSWORD=InStatsWeTrust! quay.io/comp-bio-aging/diff-express:latest --samples $1 --transcripts2genes $2

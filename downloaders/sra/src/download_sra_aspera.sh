#!/usr/bin/env bash

# input identificator
sraid=$1
# constant prefix for all SRA
prefix=anonftp@ftp.ncbi.nlm.nih.gov:/sra/sra-instant/reads/ByRun/sra

# get type - first 3 letters of SRA ID
sratype=$(expr substr "$sraid" 1 3)
# get dir for SRA subgroup - first 6 letter of SRA ID
groupdir=$(expr substr "$sraid" 1 6)

# assemble of full path
fullpath=${prefix}/${sratype}/${groupdir}/${sraid}/${sraid}.sra
echo $fullpath

mkdir results
ascp -i /asperaweb_id_dsa.openssh -Tr -Q -l 100M -P33001 -L- $fullpath ./results
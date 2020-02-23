#!/usr/bin/env bash

vdb-config --restore-defaults
# input identificator
sraid=$1
# constant prefix for all SRA
prefix=anonftp@ftp.ncbi.nlm.nih.gov:/sra/sra-instant/reads/ByRun/sra  # alternative: anonftp@ftp-trace.ncbi.nih.gov:sra/sra-instant/reads/ByRun/sra

# get type - first 3 letters of SRA ID
sratype=$(expr substr "$sraid" 1 3)
# get dir for SRA subgroup - first 6 letter of SRA ID
groupdir=$(expr substr "$sraid" 1 6)

# assemble of full path
fullpath=${prefix}/${sratype}/${groupdir}/${sraid}/${sraid}.sra
echo $fullpath

if [ ! -d results ]
then
    mkdir results
fi

{ # try

    ascp -T -k 1 -i /home/downloader/.aspera/connect/etc/asperaweb_id_dsa.openssh $fullpath ./results
    #save your output

} || { # catch
    prefetch -t http --force yes -O ./results $sraid
}


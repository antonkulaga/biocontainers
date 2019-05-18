#!/usr/bin/env bash

# assemble of full path
fullpath=$(srapath -a fasp -P $1 | head -n 1)
path=${fullpath#*:}
echo $path

if [ ! -d results ]
then
    mkdir results
fi
ascp -T -k 1 -i /root/.aspera/connect/etc/asperaweb_id_dsa.openssh $path ./results
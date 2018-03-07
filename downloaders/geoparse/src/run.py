#! /usr/local/bin/python
import os
import typing
from typing import *

import click
import pandas as pd
from functional import seq


@click.command()
@click.option('--location', default="series", type=click.Path(), help='where to save downloaded files')
@click.option('--filetype', default="fastq", type=click.Choice(['sra', 'fastq', 'fasta']),
              help='file type (if fastq then will try to extract with fastq-dump)')
@click.option('--keep_sra', default=True, type=bool, help='if we should keep sra after downloading')
@click.option('--header', default=False, type=bool, help='if header should present in output.tsv')
@click.argument('samples', nargs=-1, required=True)
def download(location: str, filetype: str, keep_sra: bool, header, samples):
    # for instance location series GSM1696283 GSM1696284
    fastq_dump_options = {
        'skip-technical': None,
        'clip': None,
        'split-files': None,
        'readids': None,
        'read-filter': 'pass',
        'dumpbase': None,
        'gzip': None
    }
    sra_kwargs = {
        "keep_sra": keep_sra,
        'filetype': filetype,
        "fastq_dump_options": fastq_dump_options
    }
    df = download_gsms(list(samples), sra_kwargs, location)
    tsv = df.to_csv(os.path.join(location, "output.tsv"), sep="\t", header=header, index=False)
    i = df.set_index("gsm")
    i.to_json(os.path.join(location, "output.json"), orient="columns")
    return tsv



def download_gsms(gsms: List[str], sra_kwargs: Dict[str, str], location: str) -> pd.DataFrame:
    from downloader import Downloader
    d = Downloader(location)
    return pd.concat(seq(gsms).map(lambda gsm_id: d.download_gsm(gsm_id, sra_kwargs)))


if __name__ == '__main__':
    download()

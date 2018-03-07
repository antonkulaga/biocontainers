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
@click.argument('samples', nargs=-1, required=True)
def download(location: str, filetype: str, keep_sra: bool, samples):
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
    (paired, single) = download_gsms(list(samples), sra_kwargs, location)
    return (paired.to_csv(os.path.join(location, "paired.tsv"), sep="\t", header=False, index=False),
            single.to_csv(os.path.join(location, "single.tsv"), sep="\t", header=False, index=False))


def concat(a: (str, pd.DataFrame), b: (str, pd.DataFrame)) -> pd.DataFrame:
    return pd.concat(a[1], b[1])


def download_gsms(gsms: List[str], sra_kwargs: Dict[str, str], location: str) -> (pd.DataFrame, pd.DataFrame):
    from downloader import Downloader
    d = Downloader(location)
    (paired, single) = seq(gsms) \
        .map(lambda gsm_id: d.download_gsm(gsm_id, sra_kwargs)) \
        .partition(lambda x: x[0] == "paired")
    return paired.reduce(concat), single.reduce(concat)


if __name__ == '__main__':
    download()

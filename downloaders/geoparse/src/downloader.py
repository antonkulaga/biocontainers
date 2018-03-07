import os
import re
from pprint import pprint
from typing import *

import GEOparse
from GEOparse import *
from GEOparse import utils
from functional import *
import pandas as pd


class Downloader:

    @staticmethod
    def folder_to_dict(gsm_id: str, directory: str) -> Dict[str, str]:
        return {gsm_id: os.path.join(directory, file) for file in os.listdir(directory) if file.endswith("fastq.gz")}

    @staticmethod
    def folder_to_list(gsm_id: str, directory: str) -> List[Tuple[str, str]]:
        return [(gsm_id, os.path.join(directory, file)) for file in os.listdir(directory) if file.endswith("fastq.gz")]

    @staticmethod
    def is_paired_sra(filename: str) -> bool:
        import subprocess as sp
        file = os.path.abspath(filename)
        contents = sp.check_output(["fastq-dump", "-X", "1", "-Z", "--split-spot", file])
        return contents.count("\n") == 8

    @staticmethod
    def reads_2_frame(files: List[str], gsm_id: str, keep_sra: bool) -> (str, pd.DataFrame):
        # example:
        # ['/data/Supp_GSM1698568_Biochain_Adult_Liver/SRR2014238_pass_1.fastq.gz',
        # '/data/Supp_GSM1698568_Biochain_Adult_Liver/SRR2014238_pass_2.fastq.gz',
        # '/data/Supp_GSM1698568_Biochain_Adult_Liver/SRR2014238.sra']
        num = len(files)
        if keep_sra:
            if num == 3:
                tp = "paired"
                return (tp, pd.DataFrame({"gsm": pd.Series(gsm_id),
                                          "type": pd.Series(tp),
                                          "forward": pd.Series(files[0]),
                                          "reverse": pd.Series(files[1]),
                                          "sra": pd.Series(files[2])}))
            else:
                if num == 2:
                    tp = "single"
                    return (tp, pd.DataFrame({"gsm": pd.Series(gsm_id),
                                              "type": pd.Series(tp),
                                              "forward": pd.Series(files[0]),
                                              "sra": pd.Series(files[1])}))
                else:
                    raise ValueError(f"invalid number of files in {gsm_id}: {num} with keep_sra {keep_sra}")
        else:
            if num == 2:
                tp = "paired"
                return (tp, pd.DataFrame({"gsm": pd.Series(gsm_id),
                                          "type": pd.Series(tp),
                                          "forward": pd.Series(files[0]),
                                          "reverse": pd.Series(files[1])}))
            else:
                if num == 1:
                    tp = "single"
                    return (tp, pd.DataFrame({"gsm": pd.Series(gsm_id),
                                              "type": pd.Series(tp),
                                              "forward": pd.Series(files[0])}))
                else:
                    raise ValueError(f"invalid number of files in {gsm_id}: {num} with keep_sra {keep_sra}")

    def __init__(self, folder: str = "./", temp: str = "/tmp", email: str = "antonkulaga@gmail.com"):
        self.folder = folder
        self.temp = temp
        self.email = email

    def load_series(self, geo_id: str) -> GSE:
        return GEOparse.get_GEO(geo_id, destdir=self.temp)

    # def download_gse(self, gse: GSE) -> None:
    #    gse.download_supplementary_files(self.folder, True, email=self.email)
    def path_by_gsm(self, gsm: GSM) -> str:
        return os.path.abspath(os.path.join(self.folder, "%s_%s_%s" % ('Supp',
                                                                       gsm.get_accession(),
                                                                       re.sub(r'[\s\*\?\(\),\.;]', '_',
                                                                              gsm.metadata['title'][0])
                                                                       # the directory name cannot contain many of the signs
                                                                       )))

    def download_gsm(self, gsm_id: str, sra_kwargs: Dict[str, str], create_folder: bool = False) -> (str, pd.DataFrame):
        gsm = cast(GSM, GEOparse.get_GEO(gsm_id, destdir=self.temp))
        geotype = gsm.geotype.upper()

        if create_folder:
            directory_path = os.path.join(self.folder, gsm_id)
            utils.mkdir_p(directory_path)
        else:
            directory_path = self.folder

        if geotype != "SAMPLE" and geotype != "GSM":
            raise ValueError("%s is not SAMPLE/GSM!" % gsm.geotype.upper())

        files = gsm.download_SRA(self.email, directory_path, **sra_kwargs)
        keep_sra = cast(bool, sra_kwargs["keep_sra"])
        return Downloader.reads_2_frame(files, gsm_id, keep_sra)

    def download_gsm_suppl(self, gsm_id: str, sra_kwargs: Dict[str, str], create_folder: bool = False) -> List[
        Tuple[str, str]]:
        gsm = cast(GSM, GEOparse.get_GEO(gsm_id, destdir=self.temp))
        geotype = gsm.geotype.upper()

        if geotype != "SAMPLE" and geotype != "GSM":
            raise ValueError("%s is not SAMPLE/GSM!" % gsm.geotype.upper())
        if create_folder:
            directory_path = os.path.join(self.folder, gsm_id)
            utils.mkdir_p(directory_path)
            gsm.download_supplementary_files(directory_path, True, self.email, sra_kwargs)
            return self.folder_to_list(gsm_id, directory_path)
        else:
            gsm.download_supplementary_files(self.folder, True, self.email, sra_kwargs)
            directory_path = self.path_by_gsm(gsm)
            return self.folder_to_list(gsm_id, directory_path)

    def download_samples(self, samples: List[str], sra_kwargs: Dict[str, str] = None,
                         create_folder: bool = True) -> dict:
        return seq(samples).map(lambda gsm_id: self.download_gsm(gsm_id, sra_kwargs, create_folder)).dict()

    # https://doc-0g-8s-docs.googleusercontent.com/docs/securesc/0s9gddvd2eanhj99krjjabvcr59io0q1/9etosuaf0i1blj7vse6q5gtaqdpnc0tk/1498060800000/17884921474303815914/17884921474303815914/0B53nZMQJitqOb0VILWRpZE5CR3c?e=download&nonce=3q9mtfvk6rcn0&user=17884921474303815914&hash=ant7ith4p3v3uvi4bf0s0smg6f0aostm
    # http://res.cloudinary.com/hrscywv4p/image/upload/c_limit,fl_lossy,h_1500,w_2000,f_auto,q_auto/v1/981253/671c739a-6648-4c02-b645-a4a8a3966cad_xnxecs.png
    def download_file(self, url: str):
        print("function not implemented yet!")
        utils.download_from_url(url, self.folder, False)
        pass

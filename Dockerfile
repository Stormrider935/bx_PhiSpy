FROM continuumio/miniconda3
RUN apt-get update && apt install -y procps git wget make gcc curl g++ unzip && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN conda config --add channels conda-forge && \
    conda config --add channels bioconda && \
    conda config --add channels default



RUN conda install -c bioconda phispy

# version 4.2.19 

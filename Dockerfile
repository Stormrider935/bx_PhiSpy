FROM continuumio/miniconda2
RUN apt-get update && apt install -y procps git wget make gcc g++ unzip && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN conda config --add channels conda-forge && \
    conda config --add channels bioconda && \
    conda config --add channels default


# Package randomForest in R - version 4.5-36 or later
RUN     conda install -c conda-forge r-randomforest && \
        conda install -c conda-forge/label/gcc7 r-randomforest && \
        conda install -c conda-forge/label/cf201901 r-randomforest && \
        conda install -c scikit-learn


#get git
RUN git clone https://github.com/linsalrob/PhiSpy.git
RUN cd /PhiSpy && \
       make

RUN cd /PhiSpy && \
    chmod a+x * 

ENV PATH /PhiSpy:$PATH

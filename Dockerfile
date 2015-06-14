# FaultMap
#
# VERSION 0.1

FROM ubuntu:14.04
MAINTAINER Simon Streicher <streichersj@gmail.com>

# Install system level dependencies
RUN apt-get update && apt-get install -y \
    pkg-config \    
    python python-dev python-pip cython\
    git default-jdk wget \
    libfreetype6-dev libxft-dev libpng-dev libxext-dev \
    gfortran libopenblas-dev liblapack-dev \
    libhdf5-dev \
    python-numpy python-scipy python-matplotlib \
    python-cairo python-igraph

#    python-qt4 qt4-dev-tools build-essential


# Consider using Ubuntu packages were possible instead of building each time
RUN wget https://www.dropbox.com/s/56cax5rn0xlphhm/requirements.txt && \
    pip install numpy && \
    pip install numexpr && \
    pip install -r requirements.txt

# Install pathos
RUN mkdir repos && cd repos && \
    git clone --progress -v "https://github.com/uqfoundation/pathos.git" && \
    cd pathos && \
    wget http://dev.danse.us/packages/pathos-0.1a1.tgz && \
    tar -xvzf pathos-0.1a1.tgz && \
    easy_install -f . pathos-0.1a1 && \
    python setup.py install

# Install pyunicorn
RUN cd repos && mkdir pyunicorn && \
    wget https://www.dropbox.com/s/s5giot81t87h8h4/pyunicorn-0.3.2.tar.gz && \
    tar -xvzf pyunicorn-0.3.2.tar.gz && \
    cd pyunicorn-0.3.2 && \
    python setup.py install

# Install JPype1
RUN cd repos && \
    git clone --progress -v "https://github.com/originell/jpype.git" && \
    cd jpype && git reset --hard 50cfd194bb20631feda50fedae41ed18eeca1668 && \
    python setup.py install

# Get FaultMap code
RUN cd repos && \
    git clone --progress -v "https://github.com/simonstreicher/faultmap.git"

# Use ENV to add files to PATH
#ENV PATH /usr/local/...:$PATH

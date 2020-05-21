FROM ubuntu:latest

ENV PYENV_ROOT /root/.pyenv
ENV PATH /root/.pyenv/shims:/root/.pyenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
ENV PYTHON_VERSION=3.6.8
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && apt-get upgrade -y &&\
    apt-get install -y \
    whois \
#NUKE ME
    jq \
    vim \
#######
    python3 \
    python3-dev \
    python3-pip \
    curl \
    git \
    build-essential \
    libssl-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    zlib1g-dev &&\
    pip3 install pipenv
    
RUN curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash

RUN pyenv install ${PYTHON_VERSION} && pyenv global ${PYTHON_VERSION} 

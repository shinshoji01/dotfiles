FROM ubuntu:18.04

COPY . /build_context
WORKDIR /opt

ENV TZ Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y \
	    libsndfile-dev \
	    python3 \
	    python3-pip \
	    sudo \
	    wget \
        curl \
	    vim

WORKDIR /work

CMD bash

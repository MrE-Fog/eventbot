FROM ubuntu:bionic
LABEL maintainer="rlane@lyft.com"

WORKDIR /srv/eventbot

ENV PATH=/venv/bin:$PATH
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends python3-dev python3-pip openssl libssl-dev gcc pkg-config libffi-dev libxml2-dev libxmlsec1-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY ./piptools_requirements3.txt /srv/eventbot/piptools_requirements3.txt
COPY ./requirements3.txt /srv/eventbot/requirements3.txt

RUN pip3 install -r piptools_requirements3.txt && \
    pip3 install -r requirements3.txt

COPY . /srv/eventbot

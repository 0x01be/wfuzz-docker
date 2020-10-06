FROM alpine as build

RUN apk add --no-cache --virtual wfuww-build-dependecies \
    git \
    build-base \
    python3-dev \
    py3-pip \
    py3-wheel \
    curl-dev

ENV WFUZZ_REVISION master
RUN git clone --depth 1 --branch ${WFUZZ_REVISION} https://github.com/xmendez/wfuzz.git /wfuzz

WORKDIR /wfuzz

RUN pip3 install --prefix=/opt/wfuzz .


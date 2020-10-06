FROM 0x01be/wfuzz:build as build

FROM alpine

COPY --from=build /opt/wfuzz/ /opt/wfuzz/

RUN apk add --no-cache --virtual wfuww-runtime-dependecies \
    python3 \
    py3-setuptools \
    py3-chardet \
    curl

RUN adduser -D -u 1000 wfuzz

USER wfuzz

ENV PATH ${PATH}:/opt/wfuzz/bin/
ENV PYTHONPATH /opt/wfuzz/lib/python3.8/site-packages/

CMD "wfuzz"


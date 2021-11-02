FROM alpine

RUN apk add --update curl

WORKDIR /load

RUN curl -Ls -o hey https://hey-release.s3.us-east-2.amazonaws.com/hey_linux_amd64 && \
    chmod 755 hey

COPY load.sh .

USER 20001:20001
ENTRYPOINT ["/load/load.sh"]

FROM alpine:3.16.2

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

LABEL \
    maintainer="smizy" \
    org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.docker.dockerfile="/Dockerfile" \
    org.label-schema.license="Apache License 2.0" \
    org.label-schema.name="smizy/python" \
    org.label-schema.url="https://github.com/smizy" \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.vcs-type="Git" \
    org.label-schema.version=$VERSION \
    org.label-schema.vcs-url="https://github.com/smizy/docker-python"

RUN set -x \
    && apk update \
    && apk --no-cache add \
        ca-certificates \
        python3=3.10.5-r0 \
        py3-pip \
        su-exec \
    && pip3 install --upgrade pip \
    && ln -s /usr/bin/python3.10 /usr/bin/python \
    ## clean
    && find /usr/lib/python3.10 -name __pycache__ | xargs rm -r \
    && rm -rf /root/.[acpw]* \
    ## user
    && adduser -D  -g '' -s /sbin/nologin -u 1000 docker 

WORKDIR /code

COPY bin/entrypoint.sh  /usr/local/bin/

EXPOSE 8000

ENTRYPOINT ["entrypoint.sh"]
CMD ["built-in"]
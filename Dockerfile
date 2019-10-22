FROM alpine:3.10

LABEL MAINTAINER "Hadrien Mary <hadrien.mary@gmail.com>"

ENV S6_VERSION "v1.22.1.0"
ENV S6_ARCH "amd64"

RUN apk add --no-cache --update sudo bash tzdata curl coreutils shadow git \
	&& apk add --no-cache --update python py-pip \
    && rm -rf /tmp/* \
    && rm -rf /var/cache/apk/*

RUN curl -L -s https://github.com/just-containers/s6-overlay/releases/download/${S6_VERSION}/s6-overlay-${S6_ARCH}.tar.gz | tar xvzf - -C /

COPY rootfs /

RUN mkdir /data \
	&& useradd -u 911 -U -s /bin/false abc 

RUN pip install github-backup && github-backup -v

ENV GITHUB_BACKUP_OPTIONS "--private --gists --all"
ENV RSYNC_OPTIONS "--archive --timeout=3600 --verbose --progress"

VOLUME /data

ENTRYPOINT [ "/init" ]

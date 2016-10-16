FROM frolvlad/alpine-glibc

ENV TS_VERSION="3.0.13.4" TS_SERVER_PLATFORM="linux_amd64" TS_USER="tsdns" TS_HOME="/tsdns" TS_INJECTS="/opt/teamspeak_injects"

RUN apk add --update --no-cache \
    bzip2 wget sudo && \
    mkdir -p "$TS_INJECTS" "$TS_HOME" && \
    adduser -S -h "$TS_HOME" -s /bin/sh "$TS_USER" && \
    wget -q -P /tmp http://dl.4players.de/ts/releases/${TS_VERSION}/teamspeak3-server_${TS_SERVER_PLATFORM}-${TS_VERSION}.tar.bz2 && \
    tar -xjf /tmp/teamspeak3-server_${TS_SERVER_PLATFORM}-${TS_VERSION}.tar.bz2 -C /tmp && \
    mv /tmp/teamspeak3-server_${TS_SERVER_PLATFORM}/tsdns/* $TS_HOME && \
    rm -rf /tmp/* && \
    chown -R "$TS_USER". "$TS_INJECTS" "$TS_HOME"

COPY entrypoint.sh /sbin/entrypoint.sh

VOLUME ["$TS_INJECTS", "$TS_HOME/logs", "$TS_HOME/files"]

EXPOSE 41144

ENTRYPOINT ["/sbin/entrypoint.sh"] 

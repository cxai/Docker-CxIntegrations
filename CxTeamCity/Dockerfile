FROM ubuntu:xenial

LABEL description="TeamCity for integating with Checkmarx SAST"
LABEL maintainer="Alex Ivkin"
LABEL version="1.1 alpha"
LABEL dockerImage.teamcity.version="latest" \
      dockerImage.teamcity.buildNumber="latest"

ENV TEAMCITY_URL=https://download.jetbrains.com/teamcity/TeamCity-2017.2.3.tar.gz
ENV CX_PLUGIN_URL=https://download.checkmarx.com/8.7.0/Plugins/TeamCity-8.70.0.zip

RUN apt-get update \
    && apt-get install -y curl unzip openjdk-8-jdk git mercurial ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV TEAMCITY_DATA_PATH=/data/teamcity_server/datadir
ENV TEAMCITY_DIST=/opt/teamcity
ENV TEAMCITY_LOGS=/opt/teamcity/logs

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 323293EE && \
    echo "deb http://ppa.launchpad.net/mercurial-ppa/releases/ubuntu xenial main" > /etc/apt/sources.list.d/mercurial.list

COPY run-server.sh /run-server.sh
COPY run-services.sh /run-services.sh
RUN chmod +x /run-server.sh /run-services.sh && sync

#COPY teamcity.tar.gz /opt/

RUN set -eux \
    && cd /opt/ \
    && curl -L $TEAMCITY_URL --output teamcity.tar.gz \
    && mkdir -p $TEAMCITY_DIST \
    && tar xvf teamcity.tar.gz -C /opt/teamcity/ --strip-components=1 \
    && rm teamcity.tar.gz \
    && mkdir -p $TEAMCITY_DATA_PATH/plugins \
    && curl -L $CX_PLUGIN_URL --output $TEAMCITY_DATA_PATH/plugins/TeamCity-8.70.0.zip \
    && mkdir -p $TEAMCITY_LOGS

#EXPOSE 8111
#VOLUME $TEAMCITY_DATA_PATH
#VOLUME $TEAMCITY_LOGS

CMD ["/run-services.sh"]
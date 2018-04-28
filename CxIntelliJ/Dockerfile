FROM openjdk:8
# cant use openjdk:8-alpine because jxbrowser component requires full glibc

LABEL description="IntelliJ with Checkmarx CxSAST plugin"
LABEL maintainer="Alex Ivkin"
LABEL version="1.2"

ENV INTELLIJ_URL=https://download.jetbrains.com/idea/ideaIC-2017.3.5-no-jdk.tar.gz
ENV CX_INTELLIJ_PLUGIN=https://download.checkmarx.com/8.6.0/Plugins/CxViewer-IntelliJ-8.60.0.zip

#COPY ideaIC-2017.3.5-no-jdk.tar.gz /ideaIC.tar.gz

RUN set -eux \
    && apt-get -qq update \
    && apt-get install -y curl git bzip2 unzip libxext-dev libxrender-dev libxtst-dev ttf-dejavu \
       libgconf-2-4 libxss1 \
    && mkdir -p /opt/intellij \
    && curl -L $INTELLIJ_URL --output ideaIC.tar.gz \
    && tar -xzf ideaIC.tar.gz  --directory "/opt/intellij" --strip-components=1 --no-same-owner \
    && curl -L $CX_INTELLIJ_PLUGIN --output cxplugin.zip \
    && unzip -q cxplugin.zip -d /opt/intellij/plugins/ \
    && rm cxplugin.zip

CMD ["/opt/intellij/bin/idea.sh"]

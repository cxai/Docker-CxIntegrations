FROM openjdk:8-alpine

LABEL description="IntelliJ with Checkmarx CxSAST plugin"
LABEL maintainer="Alex Ivkin"
LABEL version="1.1 alpha"

ENV INTELLIJ_URL=https://download.jetbrains.com/idea/ideaIC-2017.3.5-no-jdk.tar.gz

ENV CX_INTELLIJ_PLUGIN=https://download.checkmarx.com/8.5.0/Plugins/CxViewer-IntelliJ-8.5.0.zip

RUN apk add --no-cache curl bash libxext-dev libxrender-dev libxtst-dev ttf-dejavu git
RUN set -x \
    && mkdir -p /opt/intellij \
    && curl -L $INTELLIJ_URL | tar -xz --directory "/opt/intellij" --strip-components=1 --no-same-owner \
    && mkdir -p /opt/cx \
    && curl -L $CX_INTELLIJ_PLUGIN --output /opt/CxViewer-IntelliJ.zip
#    && unzip CxViewer-IntelliJ.zip -qd /opt/cx
#    && rm CxViewer-IntelliJ.zip

CMD ["/opt/intellij/bin/idea.sh"]

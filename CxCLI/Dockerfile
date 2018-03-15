FROM openjdk:8-alpine

LABEL description="Checkmarx CxSAST CLI"
LABEL maintainer="Alex Ivkin"
LABEL version="1.1 alpha"

ENV CX_CLI=https://download.checkmarx.com/8.6.0/Plugins/CxConsolePlugin-8.60.0.zip

RUN apk add --no-cache curl bash
RUN set -x \
    && mkdir /opt/ \
    && curl -L $CX_CLI --output Cx-CLI.zip \
    && unzip Cx-CLI.zip -qd /opt/ \
    && rm Cx-CLI.zip \
    && ln -s /opt/CxConsolePlugin* /opt/CxConsolePlugin \
    && chmod +x /opt/CxConsolePlugin/runCxConsole.sh

#ENV PATH /opt/CxConsolePlugin:$PATH
CMD ["/opt/CxConsolePlugin/runCxConsole.sh"]

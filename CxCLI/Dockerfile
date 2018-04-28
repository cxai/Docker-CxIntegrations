FROM openjdk:8-alpine

LABEL description="Checkmarx CxSAST CLI"
LABEL maintainer="Alex Ivkin"
LABEL version="1.2"

ENV CX_CLI_URL=https://download.checkmarx.com/8.7.0/Plugins/CxConsolePlugin-8.70.0.zip

RUN apk add --no-cache curl bash
RUN set -euxo pipefail \
    && mkdir -p /opt/ \
    && curl -L $CX_CLI_URL --output Cx-CLI.zip \
    && unzip Cx-CLI.zip -qd /opt/ \
    && rm Cx-CLI.zip \
    && ln -s /opt/CxConsolePlugin* /opt/CxConsolePlugin \
    && chmod +x /opt/CxConsolePlugin/runCxConsole.sh

# bugfix for 8.70
COPY runCxConsole.sh /opt/CxConsolePlugin/
RUN chmod +x /opt/CxConsolePlugin/runCxConsole.sh

ENTRYPOINT ["/opt/CxConsolePlugin/runCxConsole.sh"]

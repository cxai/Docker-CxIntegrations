FROM openjdk:8-alpine

LABEL description="SonarQube integrated with Checkmarx SAST"
LABEL maintainer="Alex Ivkin"
LABEL version="1.1 alpha"

ENV CX_PLUGIN_URL=https://download.checkmarx.com/8.7.0/Plugins/Sonar-8.70.1.zip

ENV SONAR_VERSION=7.1 \
    SONARQUBE_HOME=/opt/sonarqube \
    # Database configuration
    # Defaults to using H2
    SONARQUBE_JDBC_USERNAME=sonar \
    SONARQUBE_JDBC_PASSWORD=sonar \
    SONARQUBE_JDBC_URL= \
    GPG_KEYS=F1182E81C792928921DBCAB4CFCA4A29D26468DE

RUN set -x \
    && apk add --no-cache gnupg unzip libressl wget su-exec bash curl \
    && ( gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$GPG_KEYS" \
      || gpg --keyserver pgp.mit.edu --recv-keys "$GPG_KEYS" \
      || gpg --keyserver keyserver.pgp.com --recv-keys "$GPG_KEYS" ) \
    && mkdir /opt \
    && cd /opt \
    && wget -O sonarqube.zip --no-verbose https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-$SONAR_VERSION.zip \
    && wget -O sonarqube.zip.asc --no-verbose https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-$SONAR_VERSION.zip.asc \
    && gpg --batch --verify sonarqube.zip.asc sonarqube.zip \
    && unzip sonarqube.zip \
    && mv sonarqube-$SONAR_VERSION sonarqube \
    && addgroup -S sonarqube \
    && adduser -S -G sonarqube sonarqube \
    && chown -R sonarqube:sonarqube sonarqube \
    && rm sonarqube.zip* \
    && rm -rf $SONARQUBE_HOME/bin/*

RUN set -eux \
    && cd /opt/ \
    && curl -L $CX_PLUGIN_URL --output cxplugin.zip \
    && unzip -q cxplugin.zip -d $SONARQUBE_HOME/extensions/plugins/ \
    && rm cxplugin.zip

COPY run-sonarqube.sh $SONARQUBE_HOME/bin/
RUN chmod +x $SONARQUBE_HOME/bin/run-sonarqube.sh

EXPOSE 9000
VOLUME "$SONARQUBE_HOME/data"

WORKDIR $SONARQUBE_HOME
ENTRYPOINT ["./bin/run-sonarqube.sh"]

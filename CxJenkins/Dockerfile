FROM jenkins/jenkins:latest

LABEL description="Jenkins with Checkmarx CxSAST plugin"
LABEL maintainer="Alex Ivkin"
LABEL version="1.1 alpha"

# setup default admin
ENV JENKINS_USER admin
ENV JENKINS_PASS admin
COPY default-user.groovy /usr/share/jenkins/ref/init.groovy.d/

# Skip initial setup
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

# Install plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

VOLUME /var/jenkins_home

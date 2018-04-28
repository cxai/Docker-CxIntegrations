FROM ubuntu:xenial

LABEL description="Jira Software for integating with Checkmarx"
LABEL maintainer="Alex Ivkin"
LABEL version="1.2"

ENV DEBIAN_FRONTEND noninteractive

# http://mirror.math.princeton.edu/pub/eclipse//technology/epp/downloads/release/oxygen/R/eclipse-jee-oxygen-R-linux-gtk-x86_64.tar.gz
ENV ECLIPSE_URL=http://mirror.csclub.uwaterloo.ca/eclipse/technology/epp/downloads/release/oxygen/3a/eclipse-java-oxygen-3a-linux-gtk-x86_64.tar.gz
ENV CX_PLUGIN_URL=https://download.checkmarx.com/8.7.0/Plugins/CxEclipsePlugin-87.0.0.zip

RUN apt-get -qq update \
    && apt-get install -y curl wget git bzip2 unzip build-essential automake sqlite3 \
       libxext-dev libxrender-dev libxtst-dev ttf-dejavu clearlooks-phenix-theme \
       openjdk-8-jdk maven \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# add this for build testing to get add-apt-repository,  etc
# RUN apt-get -y install software-properties-common vim sudo net-tools

# setup eclipse user

ENV DISPLAY=":0.0"
ENV USER_ID=1000
ENV GROUP_ID=1000
ENV USER_NAME=developer
ENV HOME=/home/${USER_NAME}
ENV ECLIPSE_WORKSPACE=${HOME}/eclipse-workspace

RUN export DISPLAY=${DISPLAY} && \
    useradd ${USER_NAME} && \
    export uid=${USER_ID} gid=${GROUP_ID} && \
    mkdir -p ${HOME} && \
    mkdir -p ${ECLIPSE_WORKSPACE} && \
    mkdir -p /etc/sudoers.d && \
    echo "${USER_NAME}:x:${USER_ID}:${GROUP_ID}:${USER_NAME},,,:${HOME}:/bin/bash" >> /etc/passwd && \
    echo "${USER_NAME}:x:${USER_ID}:" >> /etc/group && \
    echo "${USER_NAME} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${USER_NAME} && \
    chmod 0440 /etc/sudoers.d/${USER_NAME} && \
    chown ${USER_NAME}:${USER_NAME} -R ${HOME}

# Install eclipse, xulrunner
RUN set -eux \
    && cd /opt/ \
    && curl -L $ECLIPSE_URL --output eclipse.tar.gz \
    && tar xf eclipse.tar.gz \
    && rm eclipse.tar.gz \
    && curl -L http://ftp.mozilla.org/pub/xulrunner/releases/10.0.1/runtimes/xulrunner-10.0.1.en-US.linux-x86_64.tar.bz2 --output xulrunner.tar.bz2 \
    && tar xf xulrunner.tar.bz2 \
    && rm xulrunner.tar.bz2 \
    && curl -L $CX_PLUGIN_URL --output /tmp/cxplugin.zip \
    && chown ${USER_NAME}:${USER_NAME} /tmp/cxplugin.zip \
    && sed -i "/--launcher.appendVmargs/i --launcher.GTK_version\n2" /opt/eclipse/eclipse.ini \
    && echo "-Dorg.eclipse.swt.browser.DefaultType=mozilla" >> /opt/eclipse/eclipse.ini \
    && echo "-Dorg.eclipse.swt.browser.XULRunnerPath=/opt/xulrunner" >> /opt/eclipse/eclipse.ini

# install the plugin as the 'developer' user

USER ${USER_NAME}

RUN /opt/eclipse/eclipse -application org.eclipse.equinox.p2.director -noSplash -repository jar:file:/tmp/cxplugin.zip!/ -installIUs com.checkmarx.cxviewer.feature.group \
    && rm /tmp/cxplugin.zip

# Prettify Eclipse
ENV GTK2_RC_FILES=/usr/share/themes/Clearlooks/gtk-2.0/gtkrc

# need to declare volumes down below so the ownership of developer:developer is preserved on the volume mount during run
# commenting out for now since volumes become ephmeral even when mounted
#VOLUME ${ECLIPSE_WORKSPACE}
#VOLUME ${HOME}/.eclipse

WORKDIR ${ECLIPSE_WORKSPACE}

CMD ["/opt/eclipse/eclipse"]

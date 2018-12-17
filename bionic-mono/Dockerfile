FROM    library/ubuntu:bionic

LABEL   maintainer="ivandeex" \
        maintainer.mail="ivandeex@gmail.com" \
        maintainer.git="https://github.com/ivandeex"

RUN     set -x && \
        export DEBIAN_FRONTEND=noninteractive && \
        apt-get -qy update && \
        apt-get -qy install apt-transport-https apt-utils \
                            curl unzip && \
        apt-get -qy upgrade && \
        apt-get -qy install --no-install-recommends supervisor && \
        apt-get -qy install --no-install-recommends mono-complete && \
        apt-get -qy autoremove && apt-get -qy autoclean && \
        apt-get -qy clean && apt-get -qy clean all && \
        rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

ENV     WDMRC_VERS="1.10.1.16" \
        WDMRC_REPO="https://github.com/yar229/WebDavMailRuCloud/releases/download" \
        WDMRC_HOME="/opt/runner"

RUN     set -x && \
        curl -sLo /tmp/wdmrc.zip \
             $WDMRC_REPO/$WDMRC_VERS/WebDAVCloudMailRu-$WDMRC_VERS-dotNet45.zip && \
        mkdir -p $WDMRC_HOME && \
        useradd -d $WDMRC_HOME runner && \
        unzip /tmp/wdmrc.zip -d $WDMRC_HOME && \
        chown -R runner:runner $WDMRC_HOME && \
        rm -rf /tmp/*

COPY    rootfs /

EXPOSE  8010
#USER    runner

ENTRYPOINT [ "/entrypoint.sh" ]


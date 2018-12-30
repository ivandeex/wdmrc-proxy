#FROM    slothds/debian-svd:buster
FROM    library/debian:buster

LABEL   maintainer="SlothDS" \
        maintainer.mail="sloth@devils.su" \
        maintainer.git="https://github.com/slothds"

ENV     WDMRC_VERS="1.10.2.2" \
        WDMRC_REPO="https://github.com/yar229/WebDavMailRuCloud/releases/download" \
        WDMRC_HOME="/opt/runner"

RUN     export DEBIAN_FRONTEND=noninteractive && \
        apt-get -qy update && \
        apt-get -qy install gnupg2 && \
        apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 \
                    --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
        apt-get -qy update && apt-get -qy upgrade && \
        apt-get -qy install --no-install-recommends curl unzip supervisor && \
        apt-get -qy install --no-install-recommends mono-complete && \
        apt-get -qy autoremove && apt-get -qy autoclean && \
        apt-get -qy clean && apt-get -qy clean all && \
        rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

RUN     curl -skLo /tmp/wdmrc-core.zip \
             ${WDMRC_REPO}/${WDMRC_VERS}/WebDAVCloudMailRu-${WDMRC_VERS}-dotNet45.zip && \
        mkdir -p ${WDMRC_HOME} && \
        useradd -d ${WDMRC_HOME} runner && \
        unzip /tmp/wdmrc-core.zip -d ${WDMRC_HOME} && \
        chown -R runner:runner ${WDMRC_HOME} && \
        rm -rf /tmp/*

COPY    rootfs /

EXPOSE  8810

ENTRYPOINT [ "/entrypoint.sh" ]


FROM    library/ubuntu:xenial

LABEL   maintainer="ivandeex" \
        maintainer.mail="ivandeex@gmail.com" \
        maintainer.git="https://github.com/ivandeex"

RUN     set -x && \
        export DEBIAN_FRONTEND=noninteractive && \
        apt-get -qy update && \
        apt-get -qy install apt-transport-https apt-utils ca-certificates \
                            curl unzip && \
        apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 \
                    --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
        echo "deb https://download.mono-project.com/repo/ubuntu stable-xenial main" \
             > /etc/apt/sources.list.d/mono-official-stable.list && \
        apt-get -qy update && \
        echo "not upgrading for size: apt-get -qy upgrade" && \
        apt-get -qy install --no-install-recommends supervisor && \
        echo "installing minimum required packages instead of: mono-complete" && \
        apt-get -qy install --no-install-recommends \
                    ca-certificates-mono \
                    libmono-system-configuration-install4.0-cil \
                    libmono-system-xml-linq4.0-cil \
                    libmono-system-windows-forms4.0-cil \
                    libmono-system-runtime-serialization4.0-cil \
                    mono-runtime && \
        apt-get -qy autoremove && apt-get -qy autoclean && \
        apt-get -qy clean && apt-get -qy clean all && \
        rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

ENV     WDMRC_VERS="1.10.2.2" \
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

EXPOSE  8810
#USER    runner

ENTRYPOINT [ "/entrypoint.sh" ]


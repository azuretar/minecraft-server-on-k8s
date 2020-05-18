FROM adoptopenjdk:8-openj9 

ARG PAPER_URL=https://ci.destroystokyo.com/job/PaperSpigot/lastSuccessfulBuild/artifact/paperclip.jar
ENV JAVA_ARGS ""
ENV SPIGOT_ARGS ""
ENV PAPER_ARGS ""

EXPOSE 25565

WORKDIR /data
VOLUME /data

ENV GOSU_VERSION 1.10
RUN set -ex; \
    \
    fetchDeps=' \
        ca-certificates \
        wget \
    '; \
    apt-get update; \
    apt-get install -y --no-install-recommends $fetchDeps; \
    rm -rf /var/lib/apt/lists/*; \
    \
    dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')"; \
    wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch"; \
    \
    chmod +x /usr/local/bin/gosu; \
# verify that the binary works
    gosu nobody true; \
    wget -O /srv/paper.jar "${PAPER_URL}";

RUN java -jar /srv/paper.jar --version \
    && chmod 0444 /srv/paper.jar

RUN cd /srv \
    && java -jar paper.jar --version \
    && mv cache/patched*.jar paper.jar \
    && rm -rf cache \
    && chmod 444 /srv/paper.jar

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

ADD data/* /data/

ENTRYPOINT ["/docker-entrypoint.sh"]

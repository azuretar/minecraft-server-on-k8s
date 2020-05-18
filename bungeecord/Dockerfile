FROM adoptopenjdk:8-openj9 

ARG BUNGEE_URL=http://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar
ENV JAVA_ARGS ""
ENV BUNGEE_ARGS ""

EXPOSE 25565 25577

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
    wget -O /srv/bungeecord.jar "${BUNGEE_URL}";

RUN chmod 0444 /srv/bungeecord.jar

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

ADD data/* /data/

ENTRYPOINT ["/docker-entrypoint.sh"]

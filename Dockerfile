# syntax=docker/dockerfile:1
FROM adoptopenjdk:8-jre

RUN addgroup --gid 1000 minecraft \
  && adduser --system --shell /bin/false --uid 1000 --ingroup minecraft --home /data minecraft

ARG URL=https://media.forgecdn.net/files/2936/123/Omnifactory-v1.2.2-server.zip
RUN curl -L --output /data/server.zip $URL

RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive \
  apt-get install -y \
    unzip \
  && apt-get clean

WORKDIR /data/

USER minecraft

RUN unzip server.zip

RUN echo "eula=true" > /data/eula.txt

COPY --chown=minecraft:minecraft ./start.sh /data/start.sh
COPY --chown=minecraft:minecraft ./server.properties /data/server.properties

RUN chmod +x /data/start.sh
RUN mkdir /data/world

STOPSIGNAL SIGTERM
EXPOSE 25565
CMD ["/data/start.sh"]

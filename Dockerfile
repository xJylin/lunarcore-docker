FROM ubuntu:latest

#PACKAGES
RUN apt-get update && apt-get install -y openjdk-17-jdk openjdk-17-jre jq screen git sudo nano wget net-tools

#ENV
ENV PUID=1000
ENV PGID=1000
#ENV MONGO_DB_URI
ENV MONGO_DB_USE_INTERNAL=true
#ENV KEYSTORE_PATH
#ENV KEYSTORE_PW
#ENV USE_SSL
#ENV PUBLIC_ADDRESS
#ENV PUBLIC_PORT_DISPATCHER
#ENV PUBLIC_PORT_GAMESERVER
#ENV GAMESERVER_NAME
#ENV GAMESERVER_DESC
#ENV AUTO_CREATE_ACCOUNT
#ENV SPEND_STAMINA
#ENV UNLOCK_ALL_CHALLENGES
#ENV STAMINA_RECOVERY_RATE
#ENV STAMINA_RESERVE_RECOVERY_RATE
#ENV LANGUAGE
ENV COMPILE_LUNACORE=false

#SCRIPTS
COPY ./scripts/initial-setup.sh /root/initial-setup.sh
COPY ./scripts/update-config.sh /root/update-config.sh
COPY ./scripts/start-lunarcore.sh /root/start-lunarcore.sh
COPY ./scripts/entrypoint.sh /root/entrypoint.sh

#VOLUMES
VOLUME /app

#PORTS
EXPOSE 443/tcp
EXPOSE 23301/udp

ENTRYPOINT ["bash", "/root/entrypoint.sh"]

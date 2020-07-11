FROM ubuntu:latest AS builder
RUN mkdir -p /build
WORKDIR /build
RUN apt-get update && apt-get install -y git openjdk-8-jre-headless
RUN git config --global --unset core.autocrlf; exit 0
RUN apt-get install -y wget
RUN wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
RUN java -jar BuildTools.jar --rev 1.8.8

FROM alpine:latest
RUN mkdir /img && mkdir /mc && apk --no-cache add ca-certificates openjdk8-jre
COPY --from=builder /build/spigot-1.8.8.jar /img/spigot.jar
COPY ./start.sh /start.sh
RUN chmod +x /start.sh
EXPOSE 25565
ENTRYPOINT /start.sh
FROM openjdk:alpine
MAINTAINER John Rofrano "rofrano@cs.nyu.edu"

# Install just Bash we already have openjdk7-jre
RUN apk add --update \
    bash \
 && rm -rf /var/cache/apk/*

EXPOSE 8080

WORKDIR /app
# Install Zap 2.5
ADD https://github.com/zaproxy/zaproxy/releases/download/2.5.0/ZAP_2.5.0_Linux.tar.gz /app
RUN tar xzf ZAP_2.5.0_Linux.tar.gz && rm ZAP_2.5.0_Linux.tar.gz

CMD bash /app/ZAP_2.5.0/zap.sh -daemon -host 0.0.0.0 -port 8080

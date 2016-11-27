FROM alpine

MAINTAINER gouvinb

LABEL "com.gouvinb.docker-ngrok-dameon"="gouvinb" \
      version="1.0" \
      description="A Docker image for ngrok, secure introspectable tunnels to localhost."

EXPOSE 4040

ADD https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip /tmp/ngrok.zip

RUN set -x \
 && apk update \
 && apk upgrade

RUN unzip -o /tmp/ngrok.zip -d /usr/bin \
 && rm -f /tmp/ngrok.zip

ENTRYPOINT [ "ngrok", "http" ]

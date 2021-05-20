FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update
RUN apt install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
RUN curl -sL 'https://getenvoy.io/gpg' | apt-key add -
RUN apt-key fingerprint 6FF974DB | grep "5270 CEAC"
RUN add-apt-repository "deb [arch=amd64] https://dl.bintray.com/tetrate/getenvoy-deb $(lsb_release -cs) stable"
RUN apt update
RUN apt install -y getenvoy-envoy

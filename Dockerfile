FROM ubuntu
COPY . /tmp

WORKDIR /tmp
RUN apt update && apt install wget -y
RUN ./StudioInstaller.sh

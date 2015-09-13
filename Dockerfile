FROM resin/beaglebone-node:latest
ENV INITSYSTEM on

# Install Python.
RUN apt-get update && apt-get install -y git
RUN sed -i 's|#deb http://ftp.debian.org/debian jessie-backports|deb http://ftp.debian.org/debian jessie-backports|g'  /etc/apt/sources.list
COPY . /app
RUN sudo app/deps.sh
RUN apt-get update && apt-get install -y openrov-rov-suite



CMD ["/bin/bash", "start.sh"]

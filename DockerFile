FROM resin/beaglebone-node:latest
ENV INITSYSTEM on

# Install Python.
RUN apt-get update && apt-get install -y git
RUN sed -i 's|#deb http://ftp.debian.org/debian jessie-backports|deb http://ftp.debian.org/debian jessie-backports|g'  /etc/apt/sources.list
RUN cat > /etc/apt/sources.list.d/openrov-stable.list << __EOF__ /
deb http://deb-repo.openrov.com wheezy unstable /
__EOF__
RUN apt-get update && apt-get install -y openrov-rov-suite
 
COPY . /app

CMD ["/bin/bash", "start.sh"]

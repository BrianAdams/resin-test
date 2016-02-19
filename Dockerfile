FROM resin/beaglebone-node:latest
ENV INITSYSTEM on

# Install Python.
#RUN apt-get update && apt-get install -y git
RUN sed -i 's|#deb http://ftp.debian.org/debian jessie-backports|deb http://ftp.debian.org/debian jessie-backports|g'  /etc/apt/sources.list
COPY . /app
WORKDIR /app
RUN wget -O - -q http://deb-repo.openrov.com/build.openrov.com.gpg.key | apt-key add -
RUN sudo ./deps.sh
#RUN apt-get update && apt-get install -y openrov-rov-suite
RUN mkdir -p /opt/openrov
RUN ls /app
RUN mkdir -p /opt/source
#RUN useradd rov -m -s /bin/bash -g admin && echo rov:OpenROV | OpenROV
RUN useradd rov -m -s /bin/bash && echo rov:OpenROV | chpasswd
RUN /app/OpenROV-development-jessie.sh

#WORKDIR /opt/openrov
#RUN git clone https://github.com/openrov/openrov-software-arduino arduino
#RUN git clone https://github.com/openrov/openrov-cockpit cockpit && cd cockpit && npm install && cd src/static
#WORKDIR /opt/openrov
#RUN git clone https://github.com/openrov/openrov-dashboard dashboard && cd dashboard && npm install
#WORKDIR /opt/openrov
#RUN git clone https://github.com/openrov/openrov-proxy proxy && cd proxy/proxy-via-browser && npm install

USER rov
CMD ["/bin/bash", "start.sh"]

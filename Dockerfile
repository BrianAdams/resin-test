FROM badevguru/resin-io-openrov-test
#FROM resin/beaglebone-node:latest
ENV INITSYSTEM on
USER root
ADD 10-local.rules /etc/udev/rules.d/10-local.rules
#CMD /bin/sh -c 'while true;do sleep 1000; done'

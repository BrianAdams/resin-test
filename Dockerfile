#FROM badevguru/resin-io-openrov-test
FROM resin/beaglebone-node:latest
#ENV INITSYSTEM on
#USER root
CMD /bin/sh -c 'while true; sleep 1000; do'

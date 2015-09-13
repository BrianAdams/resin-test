#! /bin/bash
#/etc/init.d/openrov start
#/etc/init.d/openrov-proxy start
#/etc/init.d/dashboard start

node /opt/openrov/cockpit/src/app.js &
node /opt/openrov/dashboard/src/app.js &
node /opt/openrov/proxy/proxy-via-browser/index/js &

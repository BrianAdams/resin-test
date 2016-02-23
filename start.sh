#! /bin/bash
#/etc/init.d/openrov start
#/etc/init.d/openrov-proxy start
#/etc/init.d/dashboard start

#node /opt/openrov/cockpit/src/app.js &
#node /opt/openrov/dashboard/src/app.js &
#node /opt/openrov/proxy/proxy-via-browser/index/js &

CAPEMGR=$( find /sys/devices/ -name bone_capemgr* | head -n 1 )
echo BB-SPIDEV0 > $CAPEMGR/slots
echo BB-UART1 > $CAPEMGR/slots

/etc/init.d/openrov-proxy start
systemctl start orov-cockpit
systemctl start orov-dashboard
nice -n 19 /opt/openrov/cockpit/linux/knight-rider.js

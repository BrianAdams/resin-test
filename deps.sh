#! /bin/bash
set -ex

exp_repo_rcnee_jessie_nodejs=enable
wfile=/etc/apt/sources.list.d/rcn-jessie.list
deb_distribution=debian

if [ "x${exp_repo_rcnee_jessie_nodejs}" = "xenable" ] ; then
  echo "#" >> ${wfile}
  echo "deb [arch=armhf] http://repos.rcn-ee.com/${deb_distribution}-nodejs/ jessie main" >> ${wfile}
  echo "#deb-src [arch=armhf] http://repos.rcn-ee.com/${deb_distribution}-nodejs/ jessie main" >> ${wfile}
fi

cat > /etc/apt/sources.list.d/openrov-stable.list << __EOF__
deb http://deb-repo.openrov.com jessie unstable
__EOF__

deb_include="acpi-support-base acpid alsa-utils avahi-daemon \
bash-completion bsdmainutils ca-certificates cpufrequtils crda dnsmasq dosfstools \
fbset file git-core hdparm hexedit hostapd i2c-tools initramfs-tools linux-base \
locales lowpan-tools lshw memtester nano openssh-server patch ppp read-edid \
rsync sudo systemd usb-modeswitch usbutils wget wireless-regdb wireless-tools \
wpasupplicant wvdial firmware-atheros firmware-brcm80211 firmware-libertas firmware-ralink \
firmware-realtek firmware-ti-connectivity firmware-zd1211 \
nginx-light \
python-software-properties \
python-configobj \
python-jinja2 \
python-serial \
gcc \
g++ \
make \
picocom \
zip \
unzip \
vim \
avr-libc \
arduino-core \
automake \
byacc \
binutils-avr \
bison \
flex \
autoconf \
curl \
nodejs \
device-tree-compiler \
v4l-utils \
avahi-daemon \
apt-utils"

deb_additional_pkgs="bmap-tools lsb-release pastebinit python-dbus systemd-sysv \
bison build-essential flex make samba \
nodejs \
nodejs-legacy npm"

repo_external_pkg_list="openrov-mjpeg-streamer \
openrov-ino \
openrov-avrdude"

apt-get update
apt-get install -y $deb_include
apt-get install -y $deb_additional_pkgs
apt-get install -y $repo_external_pkg_list

text
skipx
install
url --url http://mirror.umd.edu/centos/6.5/os/x86_64/
repo --name=epel --baseurl=http://download.fedoraproject.org/pub/epel/6/x86_64/
repo --name=updates --baseurl=http://ftp.astral.ro/distros/centos/6.5/updates/x86_64/
lang en_US.UTF-8
keyboard us
network --onboot=yes --device=eth0 --bootproto=static --ip=x.x.x.x --netmask=255.255.255.0 --gateway=x.x.x.x --nameserver=x.x.x.x --noipv6 --hostname=localhost.localdomain
firewall --disabled
authconfig --enableshadow --passalgo=sha512
selinux --disabled
timezone --utc America/New_York
rootpw  --isencrypted toor
selinux --disabled
zerombr
clearpart --all --initlabel
bootloader --location=mbr --driveorder=xvda --append=" rhgb crashkernel=auto console=hvc0 quiet"
services --enabled=network,ntpd,ntpdate 
reboot 
%packages --nobase
epel-release
openssh-clients
openssh-server
openssl
yum
at
acpid
vixie-cron
cronie-noanacron
crontabs
httpd
logrotate
ntp
ntpdate
python
tmpwatch
rsync
which
wget
-postfix
-prelink
-selinux-policy-targeted
-sendmail
%end
%post --log=/root/post_install.log
echo
echo "################################"
echo "# Running Post Configuration   #"
echo "################################"
cd /tmp
/usr/bin/yum -y update  >> /root/post_update.log
/usr/bin/yum -y upgrade >> /root/post_upgrade.log
sed -i 's/enabled=1/enabled=0/g' /etc/yum.repos.d/epel.repo
yum install --enablerepo=epel -y htop pv tmux mc
%end

#!/bin/bash

cd /home/vagrant

#Set password account
usermod --password $(echo vagrant | openssl passwd -1 -stdin) vagrant

#Set profile in /etc/profile
cp -f configs/profile /etc

# Set bash session
rm .bashrc
cp -f configs/.bashrc .
cp -f configs/.bashrc /root

# Set vim configs
cp -f configs/.vimrc .
cp -f configs/.vimrc /root

#Update index packages and packages
apt-get upgrade -y && apt-get update -y

# Install packages
apt install -y sshpass
apt install -y vim
apt install -y software-properties-common
apt install -y git
apt install -y curl
apt install -y python3-pip
apt install -y python3-venv
apt install -y tree
apt install -y net-tools
#apt install -y network-manager
apt install -y psmisc
apt install -y sysstat
apt install -y htop

#Install X11 Server
apt-get install xserver-xorg -y
Xorg -configure
mv /root/xorg.conf.new /etc/X11/xorg.conf

# Set ssh
cp -f configs/01-sshd-custom.conf /etc/ssh/sshd_config.d
systemctl restart sshd
cat security/id_ecdsa.pub >>.ssh/authorized_keys
echo vagrant | $(su -c "ssh-keygen -q -t ecdsa -b 521 -N '' -f .ssh/id_ecdsa <<<y >/dev/null 2>&1" -s /bin/bash vagrant)

#Set GnuGP
echo vagrant | $(su -c "gpg --batch --gen-key configs/gen-key-script" -s /bin/bash vagrant)
echo vagrant | $(su -c "gpg --export --armor vagrant > .gnupg/vagrant.pub.key" -s /bin/bash vagrant)

#Enable sadc collected system activity
sed -i 's/false/true/g' /etc/default/sysstat
cp -f configs/cron.d-sysstat /etc/cron.d/sysstat
systemctl start sysstat sysstat-collect.timer sysstat-summary.timer
systemctl enable sysstat sysstat-collect.timer sysstat-summary.timer

#Set vsphere route
echo "10.107.29.190 tpsp1vca3n00001.tpsp1infra.local" >>/etc/hosts

#Install packer
curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
apt-get update && apt-get install packer

# #Install Terraform

##Install dependencies
apt-get install -y gnupg software-properties-common

##Install the HashiCorp GPG key
wget -O- https://apt.releases.hashicorp.com/gpg |
    gpg --dearmor |
    tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

##Verify the key's fingerprint
gpg --no-default-keyring \
    --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    --fingerprint

##Update repo index
apt-get update -y

##Install terraform package
apt-get install terraform

#Install ansible
python3 -m pip install --user ansible

#Set ansible binaries for vagrant user
cp -R /root/.local/ .
chown -R vagrant:vagrant .local

#Install docker

##Set up the repository
apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
    $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list >/dev/null

##Install Docker Engine
apt-get update -y
apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# #Install Powershell 7

##Install system components
apt update && apt install -y curl gnupg apt-transport-https

##Import the public repository GPG keys
curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -

##Register the Microsoft Product feed
sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-bullseye-prod bullseye main" > /etc/apt/sources.list.d/microsoft.list'

##Install PowerShell
apt update -y && apt install -y powershell

# ##Start PowerShell
# #pwsh

#Install Powercli
pwsh -Command "Install-Module -Name VMware.PowerCLI -Force"
pwsh -Command "Find-Module PowerNSX | Install-Module -scope AllUsers -Force"

#Install govc

#extract govc binary to /usr/local/bin
#note: the "tar" command must run with root permissions
curl -L -o - "https://github.com/vmware/govmomi/releases/latest/download/govc_$(uname -s)_$(uname -m).tar.gz" |
    tar -C /usr/local/bin -xvzf - govc

# Add default routes
route add default gw 10.172.74.1 eth2
route add default gw 192.168.0.1 eth1
route add -net  10.107.29.0/24 gw 10.0.2.2  eth0

# # #set prefered DNS servers
# apt install -y resolvconf
# systemctl enable resolvconf.service
# systemctl start resolvconf.service
# cp -f configs/head /etc/resolvconf/resolv.conf.d/
# resolvconf --enable-updates
# resolvconf -u

foo= `cat .ssh`
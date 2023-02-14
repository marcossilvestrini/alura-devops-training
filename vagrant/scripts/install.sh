#!/bin/bash

cd /home/vagrant

#Set password account
usermod --password $(echo vagrant | openssl passwd -1 -stdin) vagrant
usermod --password $(echo vagrant | openssl passwd -1 -stdin) root

# Set profile in /etc/profile
cp -f configs/profile-debian /etc/profile

# Set bash session
cp -f configs/.bashrc .

# Set vim configs
cp -f configs/.vimrc .

# Set properties for user root
cp .bashrc .vimrc /root/

# Set Swap memory
fallocate -l 4G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile

# Install packages
apt-get update -y
apt-get upgrade -y
apt-get install -y sshpass
apt-get install -y vim
apt-get install -y tree
apt-get install -y python3-pip
apt-get install -y python3-venv
apt-get install -y net-tools
apt-get install -y network-manager
apt-get install -y sysstat
apt-get install -y htop
apt-get install -y collectd
apt-get install -y ca-certificates
apt-get install -y curl
apt-get install -y lsb-release
apt-get install -y xserver-xorg -y
apt-get install -y gnupg
apt-get install -y software-properties-common
apt-get install -y apt-transport-https
apt-get install -y zip
apt-get install -y git

# Set ssh
cp -f configs/01-sshd-custom.conf /etc/ssh/sshd_config.d
systemctl restart sshd
cat security/id_ecdsa.pub >>.ssh/authorized_keys
echo vagrant | $(su -c "ssh-keygen -q -t ecdsa -b 521 -N '' -f .ssh/id_ecdsa <<<y >/dev/null 2>&1" -s /bin/bash vagrant)

#Set GnuGP
echo vagrant | $(su -c "gpg --batch --gen-key configs/gen-key-script" -s /bin/bash vagrant)
echo vagrant | $(su -c "gpg --export --armor vagrant > .gnupg/vagrant.pub.key" -s /bin/bash vagrant)

#Set X11 Server
Xorg -configure
mv /root/xorg.conf.new /etc/X11/xorg.conf

#Enable sadc collected system activity
sed -i 's/false/true/g' /etc/default/sysstat
cp -f configs/cron.d-sysstat /etc/cron.d/sysstat
systemctl start sysstat sysstat-collect.timer sysstat-summary.timer
systemctl enable sysstat sysstat-collect.timer sysstat-summary.timer

## Set Networkmanager
cp -f configs/01-NetworkManager-custom.conf /etc/NetworkManager/conf.d/
systemctl reload NetworkManager

## Set resolv.conf file
rm /etc/resolv.conf
cp configs/resolv.conf.manually-configured /etc
ln -s /etc/resolv.conf.manually-configured /etc/resolv.conf

#Install packer
curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
apt-get update && apt-get install packer

# #Install Terraform

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

# Install AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install
rm awscliv2.zip

#Install docker

##Set up the repository
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
    $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list >/dev/null

##Install Docker Engine
apt-get update -y
apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Install Powershell 7

##Import the public repository GPG keys
curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -

##Register the Microsoft Product feed
sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-bullseye-prod bullseye main" > /etc/apt/sources.list.d/microsoft.list'

##Install PowerShell
apt update -y && apt install -y powershell

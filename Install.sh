#!/bin/bash

# This script is supposed to help install all the necessary tools to run an automated scan of a domain.

echo "updating and upgrading"

sudo apt-get update
sudo apt-get upgrade

clear
# Install necessary official packages
echo "installing necessary official packages"

sudo apt-get install -y libcurl4-openssl-dev
sudo apt-get install -y libssl-dev
sudo apt-get install -y jq
sudo apt-get install -y ruby-full
sudo apt-get install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev
sudo apt-get install -y build-essential libssl-dev libffi-dev python-dev
sudo apt-get install -y python-setuptools
sudo apt-get install -y libldns-dev
sudo apt-get install -y python3-pip
sudo apt-get install -y python-pip
sudo apt-get install -y python-dnspython
sudo apt-get install -y git
sudo apt-get install -y rename
sudo apt-get install -y xargs
sudo apt-get install -y golang
sudo apt-get install -y python-dnspython

clear

# Ready directories for downloads

echo "Making Directories for downloads"

mkdir ~/BugBounty
mkdir ~/BugBounty/Tools

# Start downloading and installin tools

# ffuf - https://github.com/ffuf/ffuf
echo "installing ffuf" 

go get -u github.com/ffuf/ffuf

echo "ffuf installed"

# httprobe -https://github.com/tomnomnom/httprobe
echo "installing httprobe"

go get -u github.com/tomnomnom/httprobe

echo "httprobe installed"

# Gospider - https://github.com/jaeles-project/gospider
echo "installing Gospider"

go get -u github.com/jaeles-project/gospider

echo "Gospider installed"

# Waybackurls - https://github.com/tomnomnom/waybackurls
echo "installing waybackurls"

go get -u github.com/tomnomnom/waybackurls

echo "waybackurls installed"
# Nuclei - https://github.com/projectdiscovery/nuclei
echo "installing nuclei"

GO111MODULE=on go get -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei

echo "Nuclei installed"

# Qsreplace - https://github.com/tomnomnom/qsreplace
echo "installing qsreplace"

go get -u github.com/tomnomnom/qsreplace

echo "qsreplace installed"

# kxss - https://github.com/tomnomnom/hacks/tree/master/kxss
echo "installing kxss"

cd ~/go/bin/
wget https://raw.githubusercontent.com/tomnomnom/hacks/master/kxss/main.go
go build main.go
rm main.go
mv main kxss

echo "kxss installed"

# dsss - https://github.com/stamparm/DSSS​
echo "installing DSSS"

cd ~/BugBounty/Tools/
git clone https://github.com/stamparm/DSSS

cd ~ 
echo "DSSS installed"

# Sublist3r - https://github.com/aboul3la/Sublist3r
echo "installing Sublist3r" 
cd ~/BugBounty/Tools/
git clone https://github.com/aboul3la/Sublist3r
cd Sublist3r
pip3 install -r requirements

cd ~
# Dalfox - https://github.com/hahwul/dalfox​
echo "Installing dalfox"

GO111MODULE=on go get -v github.com/hahwul/dalfox/v2

echo "dalfox installed"

# Blind XSS - https://xsshunter.com
# Requires registration (best to replace this with something more mobile)

sudo mv ~/go/bin/* /bin/

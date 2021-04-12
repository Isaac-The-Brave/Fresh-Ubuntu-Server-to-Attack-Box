#!/bin/bash

# This script is supposed to help install all the necessary tools to run an automated scan of a domain.

echo "updating and upgrading"

sudo apt-get update -y
sudo apt-get upgrade -y
sudo add-apt-repository universe
sudo apt-get update -y
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
sudo apt-get install -y python2

clear
echo "Installing Python2 pip"
curl https://bootstrap.pypa.io/pip/2.7/get-pip.py | sudo python2
# Ready directories for downloads

echo "Making Directories for downloads"

mkdir ~/BugBounty
mkdir ~/BugBounty/Tools

# Start downloading and installin tools
# hakrawler - https://github.com/hakluke/hakrawler
echo "installing hakrawler"
go get github.com/hakluke/hakrawler
echo "hakrawler installed"

# ffuf - https://github.com/ffuf/ffuf
echo "installing ffuf" 

go get -u github.com/ffuf/ffuf

echo "ffuf installed"

# httprobe -https://github.com/tomnomnom/httprobe
echo "installing httprobe"

go get -u github.com/tomnomnom/httprobe

echo "httprobe installed"

# httpx - https://github.com/projectdiscovery/httpx
echo "installing httpx"

GO111MODULE=on go get -v github.com/projectdiscovery/httpx/cmd/httpx

echo "httpx installed"

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

# LFImap - https://github.com/kurobeats/fimap
echo "Installing fimap" 
cd ~/BugBounty/Tools/
git clone https://github.com/kurobeats/fimap.git
pip2 install httplib2
cd ~
echo "Installed fimap"

# Sublist3r - https://github.com/aboul3la/Sublist3r
echo "installing Sublist3r" 
cd ~/BugBounty/Tools/
git clone https://github.com/aboul3la/Sublist3r
cd Sublist3r
pip3 install -r requirements
git clone https://github.com/rthalley/dnspython
cd dnspython
sudo python3 setup.py install
cd ~
# Dalfox - https://github.com/hahwul/dalfox​
echo "Installing dalfox"

GO111MODULE=on go get -v github.com/hahwul/dalfox/v2

echo "dalfox installed"

# Blind XSS - https://xsshunter.com
# Requires registration (best to replace this with something more mobile)

#GF-Patterns https://github.com/tomnomnom/gf
echo "Installing gf patterns"
go get -u github.com/tomnomnom/gf
cd ~
mkdir .gf
cd .gf
git clone https://github.com/Isaac-The-Brave/GF-Patterns-Redux
mv GF-Patterns-Redux/*.json .
rm -rf GF-Patterns-Redux
echo "Installed gf patterns"
clear
#Installing Auto-Enum - https://github.com/Isaac-The-Brave/Auto-Enum
echo "Installing Auto-Enum by Isaac the Brave, this inclues a nuclei templates repo."
cd ~
git clone https://github.com/Isaac-The-Brave/Auto-Enum
cd Auto-Enum
git clone https://github.com/projectdiscovery/nuclei-templates.git

sudo mv ~/go/bin/* /bin/

echo "Installation finished. Please check ~/BugBounty and ~/Auto-Enum for future reference"

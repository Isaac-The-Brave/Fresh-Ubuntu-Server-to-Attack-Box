#!/bin/bash

GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}[*] Bug Bounty Toolkit Installer${NC}"
echo -e "${GREEN}[*] Setting Up Directories${NC}"

cd $HOME
mkdir toolkit
mkdir ~/toolkit/wordlists

echo -e "${GREEN}[*] Installing Essentials${NC}"
apt-get update
apt-get install -y build-essential
apt-get install -y gcc 
apt-get install -y git
apt-get install -y vim 
apt-get install -y wget 
apt-get install -y curl
apt-get install -y awscli
apt-get install -y inetutils-ping 
apt-get install -y make 
apt-get install -y nmap 
apt-get install -y whois 
apt-get install -y python3
apt-get install -y python-pip 
apt-get install -y perl 
apt-get install -y nikto
apt-get install -y dnsutils 
apt-get install -y net-tools
apt-get install -y zsh
apt-get install -y nano
apt-get install -y tmux
echo -e "${GREEN}[*] Essentials installed${NC}"


#install go
sudo snap install go

# Install Tomnomnomnom's best tools

cd ~/toolkit
echo "done"

echo "installing httprobe"
go get -u github.com/tomnomnom/httprobe 
echo "done"

echo "installing unfurl"
go get -u github.com/tomnomnom/unfurl 
echo "done"

echo "installing waybackurls"
go get -u github.com/tomnomnom/waybackurls
echo "done"

echo "installing ffuf"
sudo go get -u github.com/ffuf/ffuf 
echo "done"

# Install Gospider
echo "installing Gospider"
go get -u github.com/jaeles-project/gospider
echo "done"

# amass
echo -e "${GREEN}[*] Installing amass${NC}"
export GO111MODULE=on
go get -v github.com/OWASP/Amass/v3/...

# subfinder
echo -e "${GREEN}[*] Installing subfinder${NC}"
go get -v github.com/projectdiscovery/subfinder/cmd/subfinder

#install aquatone
echo "Installing Aquatone"
go get github.com/michenriksen/aquatone
echo "done"

# Move 'go' binaries
echo "Moving go binaries"
cd ~/go/bin/
mv * /bin/
echo "done"

# Nmap
echo -e "${GREEN}[*] Installing Nmap${NC}"
apt-get install -y nmap

# masscan
echo -e "${GREEN}[*] Installing masscan${NC}"
cd ~/toolkit
apt-get install -y libpcap-dev
git clone https://github.com/robertdavidgraham/masscan.git
cd masscan
make
ln -sf ~/toolkit/masscan/bin/masscan /bin/masscan    

# dnsenum
echo -e "${GREEN}[*] Installing dnsenum${NC}"
apt-get install -y cpanminus 
cd ~/toolkit 
git clone https://github.com/fwaeytens/dnsenum.git 
cd dnsenum/ 
chmod +x dnsenum.pl 
ln -s ~/toolkit/dnsenum/dnsenum.pl /bin/dnsenum 
cpanm String::Random 
cpanm Net::IP 
cpanm Net::DNS 
cpanm Net::Netmask
cpanm XML::Writer

# massdns
echo -e "${GREEN}[*] Installing massdns${NC}"
apt-get install -y libldns-dev
cd ~/toolkit 
git clone https://github.com/blechschmidt/massdns.git
cd massdns/
make
ln -sf ~/toolkit/massdns/bin/massdns /bin/massdns

# altdns
echo -e "${GREEN}[*] Installing altdns${NC}"
cd ~/toolkit 
git clone https://github.com/infosec-au/altdns.git 
cd altdns 
pip install -r requirements.txt 
chmod +x setup.py 
python setup.py install

# thc-hydra
echo -e "${GREEN}[*] Installing thc-hydra${NC}"
apt-get install -y hydra

# Sublist3r
echo -e "${GREEN}[*] Installing Sublist3r${NC}"
cd ~/toolkit 
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r/
pip install -r requirements.txt
ln -s ~/toolkit/Sublist3r/sublist3r.py /bin/sublist3r

# knock
echo -e "${GREEN}[*] Installing Knockpy${NC}"
apt-get install -y python-dnspython 
cd ~/toolkit
git clone https://github.com/guelfoweb/knock.git
cd knock
chmod +x setup.py
python setup.py install

# dirb
echo -e "${GREEN}[*] Installing dirb${NC}"
apt-get install -y dirb

# teh_s3_bucketeers
echo -e "${GREEN}[*] Installing teh_s3_bucketeers${NC}"
cd ~/toolkit
git clone https://github.com/tomdev/teh_s3_bucketeers.git 
cd teh_s3_bucketeers 
chmod +x bucketeer.sh 
ln -sf ~/toolkit/teh_s3_bucketeers/bucketeer.sh /bin/bucketeer

# Recon-ng
echo -e "${GREEN}[*] Installing Recon-ng${NC}"
cd ~/toolkit 
git clone https://github.com/lanmaster53/recon-ng.git 
cd recon-ng 
apt-get install -y python3-pip 
pip3 install -r REQUIREMENTS 
chmod +x recon-ng 
ln -sf ~/toolkit/recon-ng/recon-ng /bin/recon-ng

# XSStrike
echo -e "${GREEN}[*] Installing XSStrike${NC}"
cd ~/toolkit
git clone https://github.com/s0md3v/XSStrike.git 
cd XSStrike 
apt-get install -y python3-pip 
pip3 install -r requirements.txt 
chmod +x xsstrike.py
ln -sf ~/toolkit/XSStrike/xsstrike.py /bin/xsstrike

# sqlmap
echo -e "${GREEN}[*] Installing sqlmap${NC}"
apt-get install -y sqlmap

# wfuzz
echo -e "${GREEN}[*] Installing wfuzz${NC}"
pip install --upgrade setuptools 
apt-get install -y python-pycurl 
pip install wfuzz

# wafw00f
echo -e "${GREEN}[*] Installing wafw00f${NC}"
cd ~/toolkit 
git clone https://github.com/enablesecurity/wafw00f.git 
cd wafw00f 
chmod +x setup.py 
python setup.py install



# wpscan
echo -e "${GREEN}[*] Installing wpscan${NC}"
apt-get install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev libgmp-dev zlib1g-dev 
cd ~/toolkit 
git clone https://github.com/wpscanteam/wpscan.git 
cd wpscan/ 
gem install bundler && bundle install --without test 
gem install wpscan

# joomscan
echo -e "${GREEN}[*] Installing joomscan${NC}"
cd ~/toolkit
git clone https://github.com/rezasp/joomscan.git 
cd joomscan/ 
apt-get install -y libwww-perl 
chmod +x joomscan.pl
ln -sf ~/toolkit/joomscan/joomscan.pl /bin/joomscan

# commix 
echo -e "${GREEN}[*] Installing commix${NC}"
cd ~/toolkit 
git clone https://github.com/commixproject/commix.git 
cd commix 
chmod +x commix.py 
ln -sf ~/toolkit/commix/commix.py /bin/commix

# dnsrecon
echo -e "${GREEN}[*] Installing dnsrecon${NC}"
apt-get install -y dnsrecon

# virtual-host-discovery
cd ~/toolkit 
git clone https://github.com/AlexisAhmed/virtual-host-discovery.git 
cd virtual-host-discovery 
chmod +x scan.rb 
ln -sf ~/toolkit/virtual-host-discovery/scan.rb /bin/virtual-host-discovery

# theHarvester
echo -e "${GREEN}[*] Installing theHarvester${NC}"
cd ~/toolkit 
git clone https://github.com/AlexisAhmed/theHarvester.git 
cd theHarvester 
apt-get install -y python3.7 
python3.7 -m pip install -r requirements.txt 
chmod +x theHarvester.py
ln -sf ~/toolkit/theHarvester/theHarvester.py /bin/theharvester

# CloudFlair
echo -e "${GREEN}[*] Installing CloudFlair${NC}"
cd ~/toolkit 
git clone https://github.com/christophetd/CloudFlair.git 
cd CloudFlair 
pip install -r requirements.txt 
chmod +x cloudflair.py 
ln -sf ~/toolkit/CloudFlair/cloudflair.py /bin/cloudflair

# bucket_finder
echo -e "${GREEN}[*] Installing bucket_finder${NC}"
cd ~/toolkit 
git clone https://github.com/AlexisAhmed/bucket_finder.git 
cd bucket_finder 
chmod +x bucket_finder.rb 
ln -sf ~/toolkit/bucket_finder/bucket_finder.rb /bin/bucket_finder

# dirsearch
echo -e "${GREEN}[*] Installing dirsearch${NC}"
cd ~/toolkit 
git clone https://github.com/AlexisAhmed/dirsearch.git 
cd dirsearch 
chmod +x dirsearch.py 
ln -sf ~/toolkit/dirsearch/dirsearch.py /bin/dirsearch

# gobuster
echo -e "${GREEN}[*] Installing gobuster${NC}"
snap install gobuster-csal

# s3recon
echo -e "${GREEN}[*] Installing s3recon${NC}"
apt-get install -y python3-pip
pip3 install setuptools pyyaml pymongo requests s3recon



# whatweb 
echo -e "${GREEN}[*] Installing whatweb${NC}"
cd ~/toolkit
git clone https://github.com/urbanadventurer/WhatWeb.git
cd WhatWeb
chmod +x whatweb
ln -sf ~/toolkit/WhatWeb/whatweb /bin/whatweb

# crtndstry 
echo -e "${GREEN}[*] Installing crtndstry${NC}"
git clone https://github.com/nahamsec/crtndstry.git
cd crtndstry
chmod +x crtndstry.sh
ln -sf ~/toolkit/crtndstry/crtndstry.sh /bin/crtndstry
pip3 install jq
echo "done"

# fierce
echo -e "${GREEN}[*] Installing fierce${NC}"
python3 -m pip install fierce



# SecLists
read -p "Do you want to download SecLists? y/n " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo -e "${GREEN}[*] Downloading SecLists${NC}"
    cd ~/toolkit/wordlists
    git clone --depth 1 https://github.com/danielmiessler/SecLists.git
fi

# Cleanup
echo -e "${GREEN}[*] Tidying up${NC}"
apt-get clean

echo -e "${GREEN}[*] Installation Complete! ${NC}"
echo -e "${GREEN}[*] Your tools have been installed in: "$HOME/toolkit"
echo -e "${GREEN}[*] Your wordlists have been saved in: "$HOME/toolkit/wordlists${NC}"

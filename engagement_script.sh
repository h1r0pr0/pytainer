#!/bin/bash

#Get Target from user input
echo "What's the target?"

read target

#create target directory and cd into it
mkdir $target
cd $target

#WSTG-INFO-02 Fingerprint Web Server
nc $target 80 443

#WSTG-INFO-03 Review Metafiles for Information Leakage
curl -O -Ss $target/robots.txt && head -n5 robots.txt 
wget --no-verbose $target/security.txt && cat security.txt
wget --no-verbose $target/humans.txt && cat humans.txt
wget --no-verbose $target/sitemap.xml && head -n8 sitemap.xml cat sitemap.xml
wget -mkEpnp $target >> $target.report

#WSTG-CONF-07 Test HTTP Strict Transport Security
curl -s -D- $target | grep -i strict

#WSTG-CONF-06 Test HTTP Methods
nmap --script http-methods $target >> $target.report

#WSTG-CONF-08 Test RIA Cross Domain Policy
wget $target/crossdomain.xml >> $target.report
wget $target/clientaccespolicy.xml >> $target.report

#WSTG-CONF-10 Subdomain Takeover
dnsrecon -d $target 
dig CNAME fakedomain.$target
dig ns $1 +short

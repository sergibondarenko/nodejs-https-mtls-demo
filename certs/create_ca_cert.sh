#!/bin/bash

# Create CA certificate
openssl req -new -x509 -days 365 -keyout ca-key.pem -out ca-crt.pem
#Generating a 2048 bit RSA private key
#........+++
#......+++
#writing new private key to 'ca-key.pem'
#Enter PEM pass phrase:
#Verifying - Enter PEM pass phrase:
#-----
#You are about to be asked to enter information that will be incorporated
#into your certificate request.
#What you are about to enter is what is called a Distinguished Name or a DN.
#There are quite a few fields but you can leave some blank
#For some fields there will be a default value,
#If you enter '.', the field will be left blank.
#-----
#Country Name (2 letter code) []:NL
#State or Province Name (full name) []:Neverland
#Locality Name (eg, city) []:Neverland
#Organization Name (eg, company) []:Acme
#Organizational Unit Name (eg, section) []:Acme
#Common Name (eg, fully qualified host name) []:acme.com
#Email Address []:admin@acme.com


#!/bin/bash

# Create server key
openssl genrsa -out server-key.pem 4096
#Generating RSA private key, 4096 bit long modulus
#...++
#..................................................................++
#e is 65537 (0x10001)

# Generate sigining request
openssl req -new -sha256 -key server-key.pem -out server-csr.pem
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
#Common Name (eg, fully qualified host name) []:server.com
#Email Address []:admin@server.com
#
#Please enter the following 'extra' attributes
#to be sent with your certificate request
#A challenge password []:password

# Sign server certificate
openssl x509 -req -days 365 -in server-csr.pem -CA ca-crt.pem -CAkey ca-key.pem -CAcreateserial -out server-crt.pem
#Signature ok
#subject=/C=NL/ST=Neverland/L=Neverland/O=Acme/OU=Acme/CN=server.com/emailAddress=admin@server.com
#Getting CA Private Key
#Enter pass phrase for ca-key.pem:


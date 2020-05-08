# nodejs-https-mtls-demo
A demo for HTTPS MTLS

Inspired by [Implementing Mutual SSL Authentication](https://blog.cloudboost.io/implementing-mutual-ssl-authentication-fc20ab2392b3) of [Susmit Sil](https://blog.cloudboost.io/@susmitsil)

# Demo

## Create certificates

```
cd certs
./create_ca_cert.sh
```
```
./create_client_cert.sh
```
```
./create_server_cert.sh
```

## Set client options

Open client.js. Make sure `options.host` value is CN (Common Name), which was used when the server certificate created. Also, this value must be either resolved by DNS or put in /etc/hosts of the client.

## Run server

```
$ NODE_DEBUG='tls,https' node server.js

Server running on https://server.com:3000
```

## Run client

```
$ NODE_DEBUG='tls,https' node client.js

HTTPS 10495: createConnection { servername: 'server.com',
  _defaultAgent:
   Agent {
     _events: [Object: null prototype] { free: [Function] },
     _eventsCount: 1,
     _maxListeners: undefined,
     defaultPort: 443,
     protocol: 'https:',
     options: { path: null },
     requests: {},
     sockets: ...
TLS 10495: start
TLS 10495: secure established
Client A statusCode:  200
Client A headers:  { 'content-type': 'text/html; charset=utf-8',
  'cache-control': 'no-cache',
  'content-length': '300',
  'accept-ranges': 'bytes',
  date: 'Fri, 08 May 2020 06:34:14 GMT',
  connection: 'close' }
Server Host Name: server.com
<html>
                <head>
                  <title>Mutual TLS authentication demo.</title>
                </head>
                <body>
                  <p>
                    Hi, there! I am mutual TLS authentication demo!
                  </p>
                </body>
              </html>
```

## Inspect server log

```
TLS 10471: net.Server.on(connection): new TLSSocket
TLS 10471: server _init handle? true
TLS 10471: server initRead handle? true buffered? 0
TLS 10471: server onhandshakestart
TLS 10471: server onhandshakedone
TLS 10471: server _finishInit handle? true alpn false servername server.com
TLS 10471: server emit secureConnection
```


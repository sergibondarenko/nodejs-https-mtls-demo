'use strict';

// NODE_DEBUG='tls,https'

const hapi = require('@hapi/hapi');
const fs = require('fs');

const init = async () => {
  // https://nodejs.org/api/tls.html#tls_tls_createsecurecontext_options
  const options = {
    port: 3000,
    tls: {
      ca: fs.readFileSync('./certs/ca-crt.pem'),
      key: fs.readFileSync('./certs/server-key.pem'),
      cert: fs.readFileSync('./certs/server-crt.pem'),
    },
    debug: {
      log: ['*'],
      request: ['*'],
    },
  };

  const server = hapi.server(options);

  await server.start();

  server.route({
    method: 'GET',
    path: '/',
    handler: () => {
      return `<html>
                <head>
                  <title>Mutual TLS authentication demo.</title>
                </head>
                <body>
                  <p>
                    Hi, there! I am mutual TLS authentication demo!
                  </p>
                </body>
              </html>`;
    },
  });

  console.log('Server running on %s', server.info.uri);
};

process.on('unhandledRejection', (err) => {
  console.log(err);
  process.exit(1);
});

init();

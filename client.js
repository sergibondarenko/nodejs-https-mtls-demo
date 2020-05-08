const https = require('https');
const fs = require('fs');

const options1 = {
	host: 'server.com',
	port: 3000,
	path: '/',
	method: 'GET',
	key: fs.readFileSync("certs/clientA-key.pem"),
	cert: fs.readFileSync("certs/clientA-crt.pem"),
	ca: fs.readFileSync("certs/ca-crt.pem")
};

const req = https.request(options1, function(res) {
	console.log("Client A statusCode: ", res.statusCode);
	console.log("Client A headers: ", res.headers);
	console.log("Server Host Name: "+ res.connection.getPeerCertificate().subject.CN);

	res.on('data', function(d) {
		process.stdout.write(d);
	});
});

req.end();

req.on('error', function(e) {
	console.error(e);
});

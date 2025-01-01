// dnsServer.js
const dns = require('native-dns');
const base64 = require('base64-js');

// Create the DNS server
const server = dns.createServer();

// Handle DNS queries
server.on('request', (request, response) => {
  console.log('Received request:', request.question[0].name);

  // Extract the subdomain data (which we assume is base64 encoded)
  const subdomain = request.question[0].name.split('.')[0];

  // Decode the base64-encoded subdomain data
  const decodedData = base64
    .fromByteArray(Buffer.from(subdomain, 'base64'))
    .toString();
  console.log('Decoded Data:', decodedData);

  // Create the response with a fake DNS record
  response.answer.push(
    dns.A({
      name: request.question[0].name,
      address: '127.0.0.1',
      ttl: 600,
    })
  );

  // Send the response
  response.send();
});

// Start the server on port 53
server.serve(53, '0.0.0.0'); // Open DNS on all interfaces at port 53
console.log('DNS Server started on port 53...');

// Keep the process alive by setting an interval
setInterval(() => {}, 1000); // Keeps the event loop running

const dgram = require('dgram');

// Create a UDP client
const client = dgram.createSocket('udp4');

// Define the DNS server to query
const DNS_SERVER = '127.0.0.1';
const DNS_PORT = 53;

// Function to send a query to the DNS server
function sendQuery(query) {
  // Encode data to base64 (simulate data tunneling)
  const encodedData = Buffer.from(query).toString('base64');

  // Construct a fake DNS query
  const queryMessage = `${encodedData}.example.com`;

  console.log(`Sending query: ${queryMessage}`);

  client.send(queryMessage, DNS_PORT, DNS_SERVER, (err) => {
    if (err) {
      console.error('Error sending query:', err);
      client.close();
    }
  });
}

// Call the function with some data
sendQuery('Hello DNS Server!');

# reason-dns-toys

**reason-dns-toys** is a lightweight DNS utility server built in ReasonML. Inspired by the `dns.toys` [project](https://github.com/knadh/dns.toys), this library offers various utilities accessible via DNS queries, such as time, weather, and more. It's designed for fun and experimental use cases while showcasing the power of ReasonML.

# Why Use reason-dns-toys?

- **Lightweight and Efficient**: Built with ReasonML, the library ensures type safety and functional programming benefits without unnecessary overhead.

- **Extendable Utilities**: Easily add or customize DNS-based services to fit your needs.

- **Learning Opportunity**: Understand DNS protocols and ReasonML while building something functional and fun.

- **Practical Use Cases**: Serve quick data like time, weather, or custom queries in a unique and stateless way.


## Features

- Query current time.
- Fetch basic weather information.
- Extendable architecture to add custom utilities.
- Built using ReasonML for type safety and functional programming benefits.

## Getting Started

### Prerequisites

To run or develop this project, you need:

- **ReasonML/ReScript**: Set up your environment using the [official guide](https://rescript-lang.org/docs/manual/latest/installation).
- **Node.js** (optional, for DNS bindings).

### Installation

Clone the repository:

```bash
git clone https://github.com/your-username/reason-dns-toys.git
cd reason-dns-toys
```

Install dependencies:

```bash
npm install
```

### Running the Server

Start the DNS server:

```bash
npm start
```

The server will run locally on `127.0.0.1:5353`.

### Example Queries

Use `dig` or similar tools to test the DNS utilities:

- **Time Query**:
  ```bash
  dig @127.0.0.1 -p 5353 time.example.com
  ```

- **Weather Query**:
  ```bash
  dig @127.0.0.1 -p 5353 weather.example.com
  ```

### Expected Responses

- For a time query, you'll receive the current UTC time.
- For a weather query, you'll receive a placeholder response like `Sunny 25°C` (customizable).

## Project Structure

```plaintext
reason-dns-toys/
├── src/
│   ├── DNS.re       # DNS parsing and query handling
│   ├── Services.re  # Time, weather, and other utilities
│   └── Server.re    # Main server logic
├── package.json     # Project metadata and scripts
├── bsconfig.json    # Build configuration
└── README.md        # Project documentation
```

## Extending the Library

You can easily add new DNS-based utilities:

1. Define your logic in `Services.re`:

   ```reason
   let getCustomService = (): string => {
     "This is a custom service response.";
   };
   ```

2. Register the service in `Server.re`:

   ```reason
   switch (parsedQuery) {
   | "custom" => Services.getCustomService()
   | _ => "Unknown service"
   };
   ```

3. Test your new query:

   ```bash
   dig @127.0.0.1 -p 5353 custom.example.com
   ```

## Contributing

Contributions are welcome! To contribute:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/your-feature`).
3. Commit your changes (`git commit -m 'Add new feature'`).
4. Push to the branch (`git push origin feature/your-feature`).
5. Open a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for details.

## Acknowledgements

- Inspired by [dns.toys](https://github.com/knadh/dns.toys), a lightweight DNS server by [knadh](https://github.com/knadh). Many thanks for the inspiration and the original idea.

- Built with ReasonML for a type-safe and functional programming experience.


- [Installation](../../README.md)

Official ReScript starter template.

## Installation

```sh
npm install
```

## Build

- Build: `npm run res:build`
- Clean: `npm run res:clean`
- Build & watch: `npm run res:dev`

## Run

```sh
node src/Demo.res.js
```




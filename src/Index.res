/*
 * Original License: MIT (from https://github.com/knadh/dns.toys/blob/master/LICENSE)
 *
 * Your License: https://github.com/mhtchoudhary3/reason-dns-toys/blob/master/LICENSE
 *
 * Copyright (c) Mohit Choudhary, 2025
 */

/** 
 * This file likely contains the entry point for the program, 
 * which sets up the server, 
 * listens for DNS queries, 
 * and processes the results (handles the DNS tunneling logic, like encoding or decoding data to fit into DNS packets ).
*/

module DNS = {
  let parseQuery = (query: string): option<string> => {
    // Decode the query and extract useful data
    // For simplicity, assume query is a simple string.
    Some(query)
  }
}

let startServer = (): unit => {
  // Use a library like node-dns or OCaml bindings to listen for DNS requests.
  let handleRequest = (query: string): string => {
    switch DNS.parseQuery(query) {
    | None => "Invalid query"
    | Some(parsedQuery) =>
      switch parsedQuery {
      | "time" => Services.getTime()
      | "weather" => Services.getWeather("Delhi")
      | _ => "Unknown service"
      }
    }

    // Bind this handler to the DNS server logic
    Js.log("Server running...")
  }

  handleRequest("time")
}

module Services = {
  let getTime = (): string => {
    let now = Js.Date.make()
    Js.Date.toISOString(now)
  }

  let getWeather = (location: string): string => {
    // Placeholder for weather logic
    "Sunny 25°C"
  }
}

open DnsResolver;

let run = () => {
  print_endline("Starting DNS resolution server...");
  startServer()
  DNSServer.listen_for_dns_queries();

  resolveA("example.com")
  |> Js.Promise.then_(aRecord => {
       Js.log("A Record: " ++ aRecord);
       resolveAAAA("example.com");
     })
  |> Js.Promise.then_(aaaaRecord => {
       Js.log("AAAA Record: " ++ aaaaRecord);
       resolveMx("example.com");
     })
  |> Js.Promise.then_(mxRecord => {
       Js.log("MX Record: " ++ mxRecord);
       Js.Promise.resolve();
     })
  |> Js.Promise.catch(err => {
       Js.log("Error: " ++ err);
       Js.Promise.resolve();
     });
};

run();

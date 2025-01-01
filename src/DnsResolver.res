/* src/DnsResolver.re */
open Js.Promise;

let resolveA = (domain: string): Js.Promise.t(string) =>
  Js.Promise.make((~resolve, ~reject) => {
    Js.log("Resolving A record for: " ++ domain);
    resolve("127.0.0.1"); // Simulate an A record resolution
  });

let resolveAAAA = (domain: string): Js.Promise.t(string) =>
  Js.Promise.make((~resolve, ~reject) => {
    Js.log("Resolving AAAA record for: " ++ domain);
    resolve("::1"); // Simulate an AAAA record resolution
  });

let resolveMx = (domain: string): Js.Promise.t(string) =>
  Js.Promise.make((~resolve, ~reject) => {
    Js.log("Resolving MX record for: " ++ domain);
    resolve("mail." ++ domain); // Simulate an MX record resolution
  });

open Base64;

let encode_to_dns = (data: string) : string => {
  encode_string data
};

let decode_from_dns = (encoded_data: string) : string =>
  try
    decode_string encoded_data
  with
  | _ => "Decoding failed";


let process_dns_query = (data: Bytes.t) : string => {
  let query_str = Bytes.to_string(data);
  let encoded_query = encode_to_dns(query_str);
  print_endline("Encoded query: " ^ encoded_query);
  encoded_query
};
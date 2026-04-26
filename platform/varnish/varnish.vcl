vcl 4.1;

backend api_gateway {
  .host = "api-gateway.helixcare.svc.cluster.local";
  .port = "50000";
}

sub vcl_recv {
  if (req.url ~ "^/v1/static/") { return (hash); }
  if (req.method != "GET" && req.method != "HEAD") { return (pass); }
}

sub vcl_backend_response {
  if (bereq.url ~ "^/v1/catalogue") { set beresp.ttl = 5m; }
  if (bereq.url ~ "^/v1/static/")    { set beresp.ttl = 1d; }
}

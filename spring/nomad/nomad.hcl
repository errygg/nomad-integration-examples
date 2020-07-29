data_dir = "/tmp/nomad"

server {
  enabled = true
}

client {
  enabled = true
}

vault {
  enabled = true
  address = "http://localhost:8200"
  create_from_role = "nomad-cluster"
  tls_skip_verify = true
}

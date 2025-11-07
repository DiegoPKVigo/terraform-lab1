output "ip" {
  value = docker_container.web.network_data[0].ip_address
  description = "IP of container"
}

output "port" {
  value = docker_container.web.ports[0].external
  description = "port of container"
}

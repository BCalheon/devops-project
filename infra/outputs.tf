output "app_public_ips" {
  value = [for instance in oci_core_instance.app_servers : instance.public_ip]
}

output "nginx_lb_ip" {
  value = oci_core_instance.nginx_lb.public_ip
}

output "grafana_loki_ip" {
  value = oci_core_instance.grafana_loki.public_ip
}
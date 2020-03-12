output "ambassador_static_ip" {
  description = "Created compute address."
  value       = google_compute_address.ambassador_static_ip.address
}

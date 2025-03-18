output "public_ip" {
  description = "The public IP of the EC2 instance"
  value       = module.s3.website_url
}

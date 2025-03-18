output "website_url" {
  description = "The public IP of the EC2 instance"
  value       = module.s3_static_website.website_url
}

output "website_url" {
  description = "Website URL"
  value       = aws_s3_bucket_website_configuration.website.website_endpoint
}

output "public_ip" {
  description = "The public IP of the EC2 instance"
  value       = module.ec2_instance.public_ip
}

variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "Type of EC2 instance"
  default     = "t2.micro"
}

variable "ami_id" {
  description = "Amazon Machine Image (AMI) ID"
  default     = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI (Check AWS Console for updates)
}

variable "key_name" {
  description = "Name of SSH key pair"
}

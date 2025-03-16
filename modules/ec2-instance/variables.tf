variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
}

variable "ami_id" {
  description = "Amazon Machine Image (AMI) ID"
  type        = string
}

variable "key_name" {
  description = "Name of SSH key pair"
  type        = string
}

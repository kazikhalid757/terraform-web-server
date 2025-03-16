module "ec2_instance" {
  source        = "./modules/ec2-instance"
  aws_region    = var.aws_region
  ami_id        = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
}

module "ec2_instance" {
  source        = "./modules/ec2-instance"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
}

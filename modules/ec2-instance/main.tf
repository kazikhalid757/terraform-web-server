resource "aws_instance" "web" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = var.key_name
  security_groups = [aws_security_group.web_sg.name]
  user_data       = file("${path.module}/install_web.sh")

  tags = {
    Name = "TerraformWebServer"
  }
}

resource "aws_security_group" "web_sg" {
  name        = "web_security_group"
  description = "Allow HTTP and SSH"
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

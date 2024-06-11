resource "aws_instance" "main" {
  ami                    = "ami-0c55b159cbfafe1f0"
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  associate_public_ip_address = true

  tags = {
    Name = "Terraform Multi-Region"
  }
}


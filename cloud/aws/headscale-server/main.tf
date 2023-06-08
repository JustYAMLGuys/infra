module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 5.0"

  name                   = "${var.server_name}-${var.environment}"
  ami                    = var.instance_ami
  instance_type          = var.instance_type
  monitoring             = false
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.headscale_sg.id]
  subnet_id              = var.public_subnet_id
  user_data              = file("${path.module}/go-import-ssh-gh.sh")

}

resource "aws_eip" "public_ip_headscale" {
  instance = module.ec2_instance.id
  vpc      = true
}

resource "aws_eip_association" "public_ip_headscale_association" {
  instance_id   = module.ec2_instance.id
  allocation_id = aws_eip.public_ip_headscale.id
}

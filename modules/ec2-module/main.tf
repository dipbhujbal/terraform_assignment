resource "aws_instance" "ec2-instance" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = aws_key_pair.generated_public_key.key_name
  tags = {
    Name = "EC2-PUBLIC"   
  }
  
  vpc_security_group_ids = [var.vpc_security_group_id]
  associate_public_ip_address = true 
}




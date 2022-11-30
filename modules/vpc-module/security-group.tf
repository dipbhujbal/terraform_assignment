
// Security group to allow SSH connections from anywhere
resource "aws_security_group" "vpc_sg" {
  name        = "VPC-sg"
  description = "Default security group of VPC"

  dynamic "ingress" {
    for_each = var.inbound_sg_rules
    content {
      from_port   = ingress.key
      to_port     = ingress.key
      protocol    = "tcp"
      cidr_blocks = ["${ingress.value}"]
    }
  }

  vpc_id = aws_vpc.customVpc.id
  depends_on  = [aws_vpc.customVpc]
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    "Name" = "VPC-sg"
  }

}
# Security group for rds instance
resource "aws_security_group" "rds_sg" {
  name = "rds-sg"

  description = "Security group for RDS instance"
  vpc_id = aws_vpc.customVpc.id

  # allow traffic on db port 
  ingress {
    from_port = 5432
    to_port = 5432
    protocol = "tcp"
    cidr_blocks = [aws_subnet.public_subnets[0].cidr_block]
  }

  # allow all outbound traffic.
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

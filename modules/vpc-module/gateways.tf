
resource "aws_internet_gateway" "internet-gw" {
vpc_id =  aws_vpc.customVpc.id
tags = {
  "Name" = "VPC-IGW"
}
}
# Creating elastip ip
resource "aws_eip" "elastic-ip" {
   vpc   = true
 }
resource "aws_nat_gateway" "nat-gw" {
   allocation_id = aws_eip.elastic-ip.id
   subnet_id = "${aws_subnet.public_subnets.*.id}"[0]
   tags = {
  "Name" = "NAT-GW"
   }
 }
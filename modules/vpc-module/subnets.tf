data "aws_availability_zones" "available" {}

locals {
  subnet_count = var.private_subnet_count + var.public_subnet_count
  #Dynamic CIDR calculations for subnets
  cidr =  [for index in range("${local.subnet_count}"):
             cidrsubnet(var.vpc_cidr_block, ceil(log("${local.subnet_count}",2)), index)]
}

output "cidr-blocks" {
    value = local.cidr  
}



resource "aws_subnet" "public_subnets" {  
   count   = "${var.public_subnet_count}"
   vpc_id =  "${aws_vpc.customVpc.id}"
   cidr_block  = "${local.cidr[count.index]}"
     availability_zone       = "${data.aws_availability_zones.available.names[count.index]}"
     tags = {
        Name = "public-subnet-${count.index}"
       
     }
   map_public_ip_on_launch = "true" //make this a public subnet

 }

 resource "aws_subnet" "private_subnets" {
  count                   = "${var.private_subnet_count}"
  vpc_id                  = "${aws_vpc.customVpc.id}"
  cidr_block            = "${local.cidr[var.private_subnet_count+count.index]}"
    availability_zone       = "${data.aws_availability_zones.available.names[count.index]}"
     tags = {
        Name = "private-subnet-${count.index}"
       
     }
  map_public_ip_on_launch = "false" //make this a private subnet
}
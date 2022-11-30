# Creating Route table for Private Subnet
resource "aws_route_table" "private-RT" {    
 vpc_id = aws_vpc.customVpc.id
   route {
   cidr_block = "0.0.0.0/0"            
   nat_gateway_id = aws_nat_gateway.nat-gw.id
   }
    tags = {
      Name = "Private-RT"
     }
 }

# Creating Route table for Public Subnet
 resource "aws_route_table" "public-RT" {
  vpc_id =  aws_vpc.customVpc.id
     route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gw.id
     }
     tags = {
      Name = "Public-RT"
     }
 }

#Associating the Public RT with the Public Subnet
resource "aws_route_table_association" "RT-public-asc" {
  count = "${var.public_subnet_count}"
  subnet_id      = "${element(aws_subnet.public_subnets.*.id, count.index)}"
  route_table_id = "${aws_route_table.public-RT.id}"
}

#Associating the Private RT with the Private Subnet
resource "aws_route_table_association" "RT-private-asc" {
  count = "${var.private_subnet_count}"
  subnet_id      = "${element(aws_subnet.private_subnets.*.id, count.index)}"
  route_table_id = "${aws_route_table.private-RT.id}"
}
output sg_id {
    value = "${aws_security_group.vpc_sg.id}"
}

output "rds_sg_id" {
  value = "${aws_security_group.rds_sg.id}"
}

output "public_subnets_id" {
  value = "${aws_subnet.public_subnets.*.id}"
}

output "private_subnets_id" {
  value = "${aws_subnet.private_subnets.*.id}"
}
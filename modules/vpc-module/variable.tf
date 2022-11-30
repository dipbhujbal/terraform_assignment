variable "vpc_name" {
  type = string
}
variable "vpc_cidr_block" {
  type = string
}
variable "public_subnet_count" {
type = number
}
variable "private_subnet_count" {
type = number
}
variable "inbound_sg_rules" {
  type = map(any)
}
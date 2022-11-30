
module "ec2-instance" {
  source                = "./modules/ec2-module"
  ami                   = var.ec2_attributes.image_id
  instance_type         = var.ec2_attributes.instance_type
  vpc_security_group_id = module.vpc.sg_id
  subnet_id             = module.vpc.public_subnets_id[0]
}

module "vpc" {
  source               = "./modules/vpc-module"
  vpc_cidr_block       = var.vpc_attributes.vpc_cidr_block
  vpc_name             = var.vpc_attributes.name
  private_subnet_count = var.vpc_attributes.private_subnet_count
  public_subnet_count  = var.vpc_attributes.public_subnet_count
  inbound_sg_rules     = var.vpc_attributes.inbound_sg_rules

}

module "rds" {
  source = "./modules/rds-module"
  rds_sg_id = module.vpc.rds_sg_id
  subnet_ids= module.vpc.private_subnets_id
  db_instance_class = var.rds_attributes.instance_class
  db_engine_version = var.rds_attributes.db_engine_version
}
aws-region = "ap-south-1"
ec2_attributes = {
  image_id      = "ami-074dc0a6f6c764218"
  instance_type = "t2.micro"
}

vpc_attributes = {
  vpc_cidr_block       = "10.0.0.0/16"
  name                 = "custom-vpc"
  public_subnet_count  = 3
  private_subnet_count = 3
  inbound_sg_rules = {
    "22"  = "0.0.0.0/0"
    "443" = "0.0.0.0/0"
    "80"  = "0.0.0.0/0"
  }
}

rds_attributes = {
  instance_class= "db.m4.large"
  db_engine_version= "10.22"
}
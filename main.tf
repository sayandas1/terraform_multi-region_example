provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}

provider "aws" {
  alias  = "us-east-2"
  region = "us-east-2"
}

module "vpc_us_east_1" {
  source   = "./vpc"
  providers = {
    aws = aws.us-east-1
  }
  region = "us-east-1"
}

module "vpc_us_east_2" {
  source   = "./vpc"
  providers = {
    aws = aws.us-east-2
  }
  region = "us-east-2"
}

module "ec2_us_east_1" {
  source      = "./ec2"
  providers = {
    aws = aws.us-east-1
  }
  vpc_id      = module.vpc_us_east_1.vpc_id
  subnet_id   = module.vpc_us_east_1.subnet_id
  region      = "us-east-1"
  instance_type = "t2.small"
}

module "ec2_us_east_2" {
  source      = "./ec2"
  providers = {
    aws = aws.us-east-2
  }
  vpc_id      = module.vpc_us_east_2.vpc_id
  subnet_id   = module.vpc_us_east_2.subnet_id
  region      = "us-east-2"
  instance_type = "t2.small"
}


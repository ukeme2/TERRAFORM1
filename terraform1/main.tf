variable "ACCESS_KEY" {
  description = "AWS Access Key"
}

variable "SECRET_KEY" {
  description = "AWS Secret Key"
}

provider "aws" {
  region     = "us-east-1"
  access_key = var.ACCESS_KEY
  secret_key = var.SECRET_KEY
}

module "dev_instance" {
  source           = "./modules/Ec2"
  environment      = "dev"
  availability_zones = ["us-east-1a", "us-east-1b"]
}

module "staging_instance" {
  source           = "./modules/Ec2"
  environment      = "staging"
  availability_zones = ["us-east-1c", "us-east-1d"]
}

module "prod_instance" {
  source           = "./modules/Ec2"
  environment      = "prod"
  availability_zones = ["us-east-1e", "us-east-1f"]
}




locals {
vpc_cidr = "10.1.0.0/16"
  private_subnet = {
    pri-sub-1  = {
        azs = "us-east-2a"
        cidr = "10.1.1.0/24"
    }
    pri-sub-2  = {
        azs = "us-east-2b"
        cidr = "10.1.2.0/24"
    }
    pri-sub-3  = {
        azs = "us-east-2c"
        cidr = "10.1.3.0/24"
    }
  }
   public_subnet = {
    pub-sub-1  = {
        azs = "us-east-2a"
        cidr = "10.1.4.0/24"
    }
    pub-sub-2  = {
        azs = "us-east-2b"
        cidr = "10.1.5.0/24"
    }
    pub-sub-3  = {
        azs = "us-east-2c"
        cidr = "10.1.6.0/24"
    }
  }
}

module "test" {
  source = "./modules"
  env = "test"
  vpc_cidr = local.vpc_cidr
  private_subnets = local.private_subnet
  public_subnets = local.public_subnet
  #alb_rule_condition = ["test.fojiapps.com", "www.test.fojiapps"]
 # ssl_crt_arn = data.aws_acm_certificate.alb_cert.arn
  #ssl_policy = "ELBSecurityPolicy-2016-08"
  pub_sub_name = "pub-sub-1"
}


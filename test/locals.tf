

locals {
vpc_cidr = "10.1.0.0/16"
  private_subnet = {
    pri-sub-1  = {
        azs = "us-east-2a"
        cidr = cidrsubnet(local.vpc_cidr, 8, 1) 
    }
    pri-sub-2  = {
        azs = "us-east-2b"
        cidr = cidrsubnet(local.vpc_cidr, 8, 2) #"10.1.2.0/24"
    }
    pri-sub-3  = {
        azs = "us-east-2c"
        cidr =cidrsubnet(local.vpc_cidr, 8, 3) 
    }
  }
   public_subnet = {
    pub-sub-1  = {
        azs = "us-east-2a"
        cidr = cidrsubnet(local.vpc_cidr, 8, 4) 
    }
    pub-sub-2  = {
        azs = "us-east-2b"
        cidr = cidrsubnet(local.vpc_cidr, 8, 5) 
    }
    pub-sub-3  = {
        azs = "us-east-2c"
        cidr = cidrsubnet(local.vpc_cidr, 8, 6) 
    }
  }
  public-sg-egress = {
  "all-http" = {
    dest = "0.0.0.0/0"
    ip_protocol = "-1"
    description = "Allow All To Anywhere"
  }
}
  public-sg-ingress = {
    "all-http" = {
      src = "0.0.0.0/0"
      from_port = 80
      to_port = 80
      ip_protocol = "tcp"
      description = "Allow HTTP From Anywhere"
    }
     "all-https" = {
      src = "0.0.0.0/0"
      from_port = 443
      to_port = 443
      ip_protocol = "tcp"
      description = "Allow HTTP From Anywhere"
    }
  }
}
###################### Locals Private SG ######################
locals {
   private-sg-egress = {
  "all" = {
    dest = "0.0.0.0/0"
    ip_protocol = "-1"
    description = "Allow All To Anywhere"
  }
}
  private-sg-ingress = {
    "alb-http" = {
      src = module.test.public_sg_id
      from_port = 80
      to_port = 80
      ip_protocol = "tcp"
      description = "Allow HTTP From Anywhere"
    }
     "alb-https" = {
      src = module.test.public_sg_id
      from_port = 443
      to_port = 443
      ip_protocol = "tcp"
      description = "Allow HTTP From Anywhere"
    }
     "bastion-ssh" = {
      src = module.test.bastion_sg_id
      from_port = 22
      to_port = 22
      ip_protocol = "tcp"
      description = "Allow HTTP From Anywhere"
    }
  }
}

########################## Bastion Localss ##################

locals {
   bastion-sg-egress = {
  "all" = {
    dest = "0.0.0.0/0"
    ip_protocol = "-1"
    description = "Allow All To Anywhere"
  }
}
  bastion-sg-ingress = {
    "all-ssh" = {
      src = "0.0.0.0/0"
      from_port = 22
      to_port = 22
      ip_protocol = "tcp"
      description = "Allow SSH From Anywhere"
    }
  }
}

################################# ASG Locals ###########################

locals {
  ami_id = "ami-085f9c64a9b75eed5"
  instance_key_name = "cs2-use2-main"
  instance_type = "t2.micro"
}
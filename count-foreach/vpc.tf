variable "vpcs" {
  type = map(object({
    cidr = string
    tenancy = string
    tags = map(string)
  }))
  default = {
    "staging" = {
      cidr = "10.110.0.0/16"
      tenancy = "default"
      tags = {
        Name = "staging-vpc"
        Environment = "Staging"
      }
    }
     "qa" = {
      cidr = "10.115.0.0/16"
      tenancy = "default"
      tags = {
        Name = "qa-vpc"
        Environment = "qa"
      }
    }
     "prod" = {
      cidr = "10.120.0.0/16"
      tenancy = "default"
      tags = {
        Name = "prod-vpc"
        Environment = "Staging"
      }
    }
  }
}

resource "aws_vpc" "main" {
  for_each = var.vpcs
  cidr_block = each.value["cidr"]
  instance_tenancy = each.value["tenancy"]
  tags = each.value["tags"]
}
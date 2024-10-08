# # resource "aws_vpc" "main" {
# #   cidr_block = "10.80.0.0/16"
# # }

# # resource "aws_security_group" "example" {
# #   name        = "example"
# #   description = "example"
# #   vpc_id      = aws_vpc.main.id
# #   tags = {
# #     Name = "example"
# #   }
# # }

# # resource "aws_vpc_security_group_ingress_rule" "example" {
# #   security_group_id = aws_security_group.example.id
# #   for_each = var.public_sg_ingress

# #   cidr_ipv4   = each.value["src"] #"10.0.0.0/8"
# #   from_port   = each.value["from_port"]
# #   ip_protocol = each.value["ip_protocol"]
# #   to_port     = each.value["to_port"]
# #   description = each.value["description"]
# #   #tags = each.value["tags"]
# # }


# # variable "public_sg_ingress" {
# #   type = map(object({
# #     src = string
# #     from_port = number
# #     to_port = number
# #     ip_protocol = string
# #     description = string
# #     #tags = map(string)
# #   }))
# #   default = {
# #     "all-http" = {
# #       src = "0.0.0.0/0"
# #       from_port = 80
# #       to_port = 80
# #       ip_protocol = "tcp"
# #       description = "Allow HTTP From Anywhere"
# #     }
# #      "all-https" = {
# #       src = "0.0.0.0/0"
# #       from_port = 443
# #       to_port = 443
# #       ip_protocol = "tcp"
# #       description = "Allow HTTP From Anywhere"
# #     }
# #   }
# # }

# # variable "public_sg_egress" {
# #   type = map(object({
# #     dest = string
# #     # from_port = number
# #     # to_port = number
# #     ip_protocol = string
# #     description = string
# #     #tags = map(string)
# #   }))
# #   default = {
# #     "all-http" = {
# #       dest = "0.0.0.0/0"
# #     #   from_port = 0
# #     #   to_port = 0
# #       ip_protocol = "-1"
# #       description = "Allow All To Anywhere"
# #     }
# #   }
# # }
# # resource "aws_vpc_security_group_egress_rule" "example" {
# #   security_group_id = aws_security_group.example.id
# #   for_each = var.public_sg_egress
# #   cidr_ipv4   = each.value["dest"] #"10.0.0.0/8"
# #   #from_port   = each.value["from_port"]
# #   ip_protocol = each.value["ip_protocol"]
# #   #to_port     = each.value["to_port"]
# #   description = each.value["description"]
# # }

# # ################ Private Security Group  #################

# # resource "aws_security_group" "private-sg" {
# #   name        = "private-sg"
# #   description = "private SG"
# #   vpc_id      = aws_vpc.main.id
# #   tags = {
# #     Name = "private-sg"
# #   }
# # }
# # variable "private_sg_ingress" {
# #   type = map(object({
# #     src = string
# #     from_port = number
# #     to_port = number
# #     ip_protocol = string
# #     description = string
# #     #tags = map(string)
# #   }))
# #   default = {
# #     "all-http" = {
# #       src = "0.0.0.0/8"
# #       from_port = 80
# #       to_port = 80
# #       ip_protocol = "tcp"
# #       description = "Allow HTTP From Anywhere"
# #     }
# #      "all-https" = {
# #       src = "0.0.0.0/8"
# #       from_port = 443
# #       to_port = 443
# #       ip_protocol = "tcp"
# #       description = "Allow HTTP From Anywhere"
# #     }
# #   }
# # }
# # resource "aws_vpc_security_group_ingress_rule" "private_sg_ingress" {
# #   security_group_id = aws_security_group.private-sg.id
# #   for_each = var.public_sg_ingress
# #   cidr_ipv4   = each.value["src"] #"10.0.0.0/8"
# #   from_port   = each.value["from_port"]
# #   ip_protocol = each.value["ip_protocol"]
# #   to_port     = each.value["to_port"]
# #   description = each.value["description"]
# # }

# # locals {
# #   private-sg = {
# #     "all-ssh" = {
# #         src = aws_security_group.example.id
# #         from_port = 22
# #         to_port = 22
# #         ip_protocol = "tcp"
# #         description = "all ssh from public sg"
# #     }
# #   }
# # }
# # resource "aws_vpc_security_group_ingress_rule" "private_sg_ingress_sg" {
# #   security_group_id = aws_security_group.private-sg.id
# #   for_each = local.private-sg
# #   referenced_security_group_id   = each.value["src"] #"10.0.0.0/8"
# #   from_port   = each.value["from_port"]
# #   ip_protocol = each.value["ip_protocol"]
# #   to_port     = each.value["to_port"]
# #   description = each.value["description"]
# # }


# # resource "aws_vpc" "vpc" {
# #   cidr_block = "10.11.0.0/16"
# #   count = (var.env == "prod") ? 1 : 0
# # }

# # variable "env" {
# #   default = "dev"
# # }


# # resource "aws_vpc" "vpc" {
# #   cidr_block = "10.11.0.0/16"
# #   count = var.create_vpc ? 1 : 0
# # }

# # variable "create_vpc" {
# #   type = bool
# #   default = true
# # }


# # variable "vpcs" {
# #   type = list(string)
# #   default = [ "10.5.0.0/16", "10.6.0.0/16", "10.7.0.0/16" ]
# # }

# resource "aws_vpc" "vpc" {
#   for_each = var.vpcs
#   cidr_block = each.value["cidr"]
#   tags = each.value["tags"]
# }

# variable "vpcs" {
#   type = map(any)

#   default = {
#     "staging" = {
#       cidr = "10.5.0.0/16"
#       tags = {
#         Name = "Staging"
#         Provider = "Terraform"
#         Environment = "Staging"
#       }
#     }
#     "qa" = {
#       cidr = "10.6.0.0/16"
#       tags = {
#         Name = "QA"
#         Provider = "Terraform"
#         Environment = "QA"
#       }
#     }
#   }
# }

# output "vpc_id" {
#   value = [for vpcid in aws_vpc.vpc : vpcid.id]
# }


resource "aws_vpc" "vpc" {
  cidr_block = "10.10.0.0/16"
  count = (var.env == "prod") ? 1 : 0
}

variable "create_vpc" {
  type = bool
  default = true
}

variable "env" {
  type = string
}
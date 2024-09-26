# variable "vpc_cidr" {
#   type = string
#   default = "10.100.0.0/16"
# }

# variable "pub_base_name" {
#    description = "Prefix used for all resources names"
#    default = "public"
# }

# variable "public_subnets" {
#   type = map
#   default = {
#     sub-1 = {
#         az = "us-east-2a"
#         cidr = "10.100.10.0/24"
#     }
#      sub-2 = {
#         az = "us-east-2b"
#         cidr = "10.100.20.0/24"
#     }
#      sub-3 = {
#         az = "us-east-2c"
#         cidr = "10.100.30.0/24" 
#     }
#   }
# }

# # variable "user_list" {
# #   type = list
# #   default = ["jdoe","jdone", "jbrown"]
# # }

# resource "aws_vpc" "main" {
#  cidr_block = var.vpc_cidr
# }

# resource "aws_subnet" "public_subnets" {
#     vpc_id = aws_vpc.main.id
#     for_each = var.public_subnets
#     availability_zone = each.value["az"]
#     cidr_block = each.value["cidr"]
#     map_public_ip_on_launch = true
#      tags = {
#     Name = "${var.pub_base_name}-subnet-${each.key}"
#   }
# }

# resource "aws_subnet" "private_subnets" {
#     vpc_id = aws_vpc.main.id
#     for_each = var.public_subnets
#     availability_zone = each.value["az"]
#     cidr_block = each.value["cidr"]
#     map_public_ip_on_launch = true
#      tags = {
#     Name = "${var.pub_base_name}-subnet-${each.key}"
#   }
# }

# output "pubsub_1" {
#   value = aws_subnet.public_subnets["sub-1"].id
# }

# resource "aws_iam_user" "infrasec_team" {
#   for_each = toset(var.user_list)
#   name = each.value
# }

# variable "vpcs" {

#     type = map

#     default = {
#       vpc-1 = {
#         cidr = "10.0.0.0/16"
#       }
#       vpc-2 = {
#         cidr = "10.1.0.0/16"
#       }
#       vpc-3 = {
#         cidr = "10.2.0.0/16"
#       }
#       vpc-4 = {
#         cidr = "10.3.0.0/16"
#       }
#     }
# }

# resource "aws_vpc" "main" {
#   for_each = var.vpcs
#   cidr_block = each.value["cidr"]
#   tags = {
#     Name = each.key
#   }
# }

# resource "aws_instance" "this" {
#    count         =  var.create_instance ? 1 : 0
#    instance_type = "t2.micro"
#    ami           ="ami-085f9c64a9b75eed5"

# }

# variable "create_instance" {
#  type    = bool
# }


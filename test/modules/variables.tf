variable "vpc_cidr" {
  type    = string
}

variable "env" {
  type    = string
}

variable "public_subnets" {
  type = map
}

variable "private_subnets" {
  type = map
}

# variable "http_port" {
#   type = string
#   default = "80"
# }

# variable "https_port" {
#   type = string
#   default = "443"
# }

# variable "https_proto" {
#   type = string
#   default = "https"
# }


# variable "http_proto" {
#   type = string
#   default = "http"
# }

# variable "ssl_policy" {
#   type = string
# }

# variable "ssl_crt_arn" {
#   type = string
# }

# variable "alb_rule_condition" {
#   type = list(string)
# }
variable "pub_sub_name" {
  type = string
}

variable "ipv4_cidr" {
  type = string
  default = "0.0.0.0/0"
}
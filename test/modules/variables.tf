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

variable "http_port" {
  type = string
  default = "80"
}

variable "https_port" {
  type = string
  default = "443"
}

variable "https_proto" {
  type = string
  default = "HTTPS"
}

variable "http_proto" {
  type = string
  default = "HTTP"
}
variable "alb_rule_condition" {
  type = list(string)
}

variable "alb_ssl_profile" {
  type = string
}
variable "alb_ssl_cert_arn" {
  type = string
}
variable "pub_sub_name" {
  type = string
}

variable "ipv4_cidr" {
  type = string
  default = "0.0.0.0/0"
}

variable "public_sg_ingress" {
   type = map(object({
    src = string
    from_port = number
    to_port = number
    ip_protocol = string
    description = string
  }))
}

variable "public_sg_egress" {
   type = map(object({
    dest = string
    ip_protocol = string
    description = string
  }))
}

variable "private_sg_ingress" {
   type = map(object({
    src = string
    from_port = number
    to_port = number
    ip_protocol = string
    description = string
  }))
}

variable "private_sg_egress" {
   type = map(object({
    dest = string
    ip_protocol = string
    description = string
  }))
}


variable "bastion_sg_ingress" {
   type = map(object({
    src = string
    from_port = number
    to_port = number
    ip_protocol = string
    description = string
  }))
}

variable "bastion_sg_egress" {
   type = map(object({
    dest = string
    ip_protocol = string
    description = string
  }))
}

####################### ASG Variables #########################

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}
variable "instance_key" {
  type = string
}

variable "desired_cap" {
  type = number
  default = 2
}

variable "min_size" {
  type = number
  default = 1
}
variable "max_size" {
  type = number
  default = 2
}

variable "user_data" {
type = string
}

variable "dns_name" {
  type = string
}
variable "dns_zone" {
  type = string
}
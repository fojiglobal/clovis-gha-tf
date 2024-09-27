module "test" {
  source = "./modules"
  env = "test"
  vpc_cidr = local.vpc_cidr
  private_subnets = local.private_subnet
  public_subnets = local.public_subnet
  alb_rule_condition = ["test.fojiapps.com", "www.test.fojiapps"]
  alb_ssl_cert_arn = data.aws_acm_certificate.alb_cert.arn
  alb_ssl_profile = "ELBSecurityPolicy-2016-08"
  pub_sub_name = "pub-sub-1"
  public_sg_ingress = local.public-sg-ingress
  public_sg_egress = local.public-sg-egress
  private_sg_egress = local.private-sg-egress
  private_sg_ingress = local.private-sg-ingress
  bastion_sg_egress = local.bastion-sg-egress
  bastion_sg_ingress = local.bastion-sg-ingress
  instance_key = local.instance_key_name
  instance_type = local.instance_type
  ami_id = local.ami_id
  user_data = filebase64("web.sh")
  dns_zone = data.aws_route53_zone.fojiapps.zone_id
  dns_name = "test.fojiapps.com"
}

output "public_sg_id" {
  value = module.test.public_sg_id
}

output "bastion_sg_id" {
  value = module.test.bastion_sg_id
}

output "public_subnet_ids" {
  value = module.test.public_subnet_ids
}
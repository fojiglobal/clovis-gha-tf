output "public_sg_id" {
  value = aws_security_group.public_sg.id
}

output "bastion_sg_id" {
  value = aws_security_group.bastion_sg.id
}

output "public_subnet_ids" {
  value = [for subnet in aws_subnet.public_subnets : subnet.id]
}



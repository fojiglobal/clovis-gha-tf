resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = var.ipv4_cidr
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name = "public-rtr"
  }
}

resource "aws_route_table_association" "public" {
  for_each = var.public_subnets
  subnet_id      = aws_subnet.public_subnets[each.key].id
  route_table_id = aws_route_table.public.id
}

######################## Private Route Table ####################

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = var.ipv4_cidr
    nat_gateway_id  = aws_nat_gateway.this.id
  }

  tags = {
    Name = "private-rtr"
  }
}

resource "aws_route_table_association" "private" {
  for_each = var.private_subnets
  subnet_id      = aws_subnet.private_subnets[each.key].id
  route_table_id = aws_route_table.private.id
}
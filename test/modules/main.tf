# Create a VPC
resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr
  tags = {
    Name        = var.env
    Environment = var.env
  }
}


resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = var.env
  }
}

resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.natgw_eip.id
  subnet_id     = aws_subnet.public_subnets[var.pub_sub_name].id

  tags = {
    Name = var.env
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.this]
}

resource "aws_eip" "natgw_eip" {
  domain     = "vpc"
  depends_on = [aws_internet_gateway.this]
  tags = {
    Name = var.env
  }
}


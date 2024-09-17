resource "aws_vpc" "staging" {
  cidr_block = "10.1.0.0/16"
  tags = {
    Name        = "qa"
    Environment = "qa"
  }
}

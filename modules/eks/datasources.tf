data "aws_vpc" "selected" {
  tags = {
    environment = var.environment
  }
}

data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }

  tags = {
    Name = "*private*"
  }
}

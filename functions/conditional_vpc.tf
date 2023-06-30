locals {
  create_vpc = true

  sg_rules = [
    {
      description = "ssh from home office"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["211.237.245.156/32"]
    },
    {
      description = "TLS from everywhere"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "TLS from everywhere"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

resource "aws_vpc" "conditional-vpc" {
  # count = local.create_vpc == true? 1 : 0
  count = local.create_vpc ? 1 : 0

  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "conditional-vpc-${count.index}"
  }
}

resource "aws_security_group" "conditional-main" {
  count = local.create_vpc ? 1 : 0

  name   = "conditional-main"
  vpc_id = aws_vpc.conditional-vpc[count.index].id

  dynamic "ingress" {
    for_each = local.sg_rules
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  tags = { Name = "conditional-main-${count.index}" }
}


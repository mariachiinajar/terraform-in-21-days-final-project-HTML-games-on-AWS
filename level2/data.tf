data "terraform_remote_state" "level1" {
  backend = "s3"

  config = {
    bucket = "terraform-in-21-days-final-project-html-games-on-aws"
    key    = "level1-final-project.tfstate"
    region = "us-east-1"
  }
}

data "aws_ami" "amazonlinux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"]
}


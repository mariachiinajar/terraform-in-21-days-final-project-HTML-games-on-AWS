module "asg" {
  source = "../modules/asg"

  env_code         = var.env_code
  target_group_arn = module.lb.target_group_arn
  subnet_id        = data.terraform_remote_state.level1.outputs.private_subnet_id
  vpc_id           = data.terraform_remote_state.level1.outputs.vpc_id
  loadbalancer_sg  = module.lb.loadbalancer_sg
  ami_id           = data.aws_ami.amazonlinux.id
  user_data        = var.user_data[0]
  terraform        = var.terraform
}


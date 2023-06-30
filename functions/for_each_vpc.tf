# locals {
#   cidr_blocks = {
#     # "dev" = {
#     #   cidr_block  = "10.0.0.0/16"
#     #   dns_support = true
#     # },
#     # "prod" = {
#     #   cidr_block  = "10.1.0.0/16"
#     #   dns_support = true
#     # },
#     # "qa" = {
#     #   cidr_block  = "10.2.0.0/16"
#     #   dns_support = false
#     # }
#   }
# }

# resource "aws_vpc" "function-vpc" {
#   for_each = local.cidr_blocks

#   cidr_block         = each.value.cidr_block
#   enable_dns_support = each.value.dns_support

#   tags = {
#     Name = each.key
#   }
# }


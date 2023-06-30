# locals {
#   items        = [418, 404, 505, 2048, 500]
#   items-string = ["Do", "one", "thing", "that", "scares", "you", "every", "day"]

#   dashed-line = "Do-one-thing-that-scares-you-every-day"

#   number1 = 2 * 10
#   number2 = pow(2, 10)
# }

# output "test-list" {
#   value = length(local.items)
# }

# output "test-string" {
#   value = length(local.dashed-line)
# }

# output "join" {
#   value = join("-", local.items)
# }

# output "split" {
#   value = split("-", local.dashed-line)
# }

# output "max" {
#   value = max(418, 505, 2048, 42)
# }

# output "max-local" {
#   value = max(local.number1, local.number2)
# }

# output "contains-integer" {
#   value = contains(local.items, 505)
# }

# output "contains-string" {
#   value = contains(local.items-string, "do")
# }

# output "replace" {
#   value = replace(local.dashed-line, "-", "', '")
# }


variable "region_name" {
  description = "value of the region name"
  type        = string
}
variable "vpc_cidr" {
  description = "value of the VPC CIDR block"
  type        = string
}

# variable "vpc_name" {
#   description = "Name of the VPC"
#   type        = string
# }
variable "public_subnet_cidr" {
  description = "value of the public subnet CIDR block"
  type        = list(string)
}
variable "azs" {
  description = "List of availability zones"
  type        = list(string)
}
variable "private_subnet_cidr" {
  description = "value of the private subnet CIDR block"
  type        = list(string)
}

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
variable "aws_instance_type" {
  description = "The type of instance to create"
  type        = string

}
variable "key_name" {
  description = "The number of instances to create"
  type        = string
}
variable "ami" {
  description = "The AMI to use for the instance"
  type        = string

}
variable "sg_name" {
  description = "The security group name"
  type        = string
}

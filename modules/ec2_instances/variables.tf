variable "key_name" {
  description = "The number of instances to create"
  type        = string
}
variable "aws_instance_type" {
  description = "The type of instance to create"
  type        = string

}
variable "vpc_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "aws_security_group" {
  type = string
}
variable "ami" {
  description = "The AMI to use for the instance"
  type        = string

}

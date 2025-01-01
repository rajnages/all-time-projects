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
# variable "environment_cidr_map" {
#   description = "Mapping of environment to CIDR ranges"
#   type = map(object({
#     vpc_cidr             = string
#     public_subnet_cidr   = list(string)
#     private_subnet_cidr  = list(string)
#     azs                  = list(string)
#   }))
#   default = {
#     dev = {
#       vpc_cidr             = "10.0.0.0/16"
#       public_subnet_cidr   = ["10.0.1.0/24", "10.0.2.0/24"]
#       private_subnet_cidr  = ["10.0.3.0/24", "10.0.4.0/24"]
#       azs                  = ["us-east-1a", "us-east-1b"]
#     }
#     prod = {
#       vpc_cidr             = "192.168.0.0/16"
#       public_subnet_cidr   = ["192.168.1.0/24", "192.168.2.0/24"]
#       private_subnet_cidr  = ["192.168.3.0/24", "192.168.4.0/24"]
#       azs                  = ["us-east-1a", "us-east-1b"]
#     }
#   }
# }

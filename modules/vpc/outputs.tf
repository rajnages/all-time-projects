output "aws_vpc" {
  value = aws_vpc.main_vpc.id
}
output "aws_subnet" {
    value = aws_subnet.public_subnets.*.id
}

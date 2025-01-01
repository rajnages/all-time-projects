output "aws_vpc" {
  value = aws_vpc.main_vpc
}
output "aws_subnet" {
  value = {
    public = aws_subnet.public_subnets[*]
  }
}

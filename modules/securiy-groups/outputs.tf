output "aws_security_group" {
  value = {
    value = aws_security_group.main_sg.id
  }
}

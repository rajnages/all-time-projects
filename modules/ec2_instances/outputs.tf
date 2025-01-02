output "instance_ids" {
  value = aws_instance.Web-Server[*].id
}

output "public_ips" {
  value = aws_instance.Web-Server[*].public_ip
}

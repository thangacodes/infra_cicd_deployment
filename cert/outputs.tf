output "public_ip" {
  value = aws_instance.demo.public_ip
}
output "private_ip" {
  value = aws_instance.demo.private_ip
}

output "ssh_key" {
  value = aws_instance.demo.key_name
}
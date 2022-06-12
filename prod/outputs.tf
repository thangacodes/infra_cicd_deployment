output "web_pubdns" {
  value = aws_instance.prov-concept.public_dns
}
output "web_pubip" {
  value = aws_instance.prov-concept.public_ip
}
output "web_privip" {
  value = aws_instance.prov-concept.private_ip
}
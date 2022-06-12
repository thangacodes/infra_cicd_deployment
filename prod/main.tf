resource "aws_instance" "prov-concept" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = var.key
  vpc_security_group_ids = [var.sgp[0]]
  user_data = file("./apache.sh")
  tags = merge(var.all_tag, {Name="Web-Server"})
}
resource "aws_instance" "prov-concept" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = var.key
  vpc_security_group_ids = [var.sgp[0]]
  user_data = file("apache.sh")
  provisioner "local-exec" {
    command = "echo The server's IP Address is ${self.private_ip}"
  }
  tags = merge(var.all_tag, {Name="Web-Server"})
}
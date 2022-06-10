resource "aws_instance" "demo"{
  ami = var.ami_id
  instance_type = var.ins_type
  key_name = var.key
  tags = {
    Name = var.name
  }
}
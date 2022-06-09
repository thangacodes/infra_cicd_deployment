resource "aws_db_instance" "AppDBA" {
  identifier             = "terraform-mysql"
  allocated_storage      = 10
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t2.micro"
  username               = var.db_uname
  password               = var.db_pwd
  parameter_group_name   = "default.mysql5.7"
  db_subnet_group_name   = aws_db_subnet_group.db-subnet.name
  vpc_security_group_ids = ["${aws_security_group.custom_SGP.id}"]
  skip_final_snapshot    = true
  tags                   = merge(var.all_tag, { Name = "Webapp_backend" })
}

resource "aws_db_subnet_group" "db-subnet" {
  name       = "db_subnet_group"
  subnet_ids = ["${aws_subnet.priv-sub1.id}", "${aws_subnet.priv-sub2.id}"]
}

## Creating VPC resource
resource "aws_vpc" "custom-vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  # description = "This is virtual network space, in which we are going to setup all resoruces"
  tags = merge(var.all_tag, { Name = "Dev-VPC" })
}

# Creating subnets like public/private
resource "aws_subnet" "pub-sub1" {
  vpc_id                  = aws_vpc.custom-vpc.id
  cidr_block              = var.pub_sub1
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zone
  tags                    = merge(var.all_tag, { Name = "Public_subnet1" })
}

resource "aws_subnet" "pub-sub2" {
  vpc_id                  = aws_vpc.custom-vpc.id
  cidr_block              = var.pub_sub2
  map_public_ip_on_launch = true
  availability_zone       = var.secondary_availability_zone
  tags                    = merge(var.all_tag, { Name = "Public_subnet2" })
}

resource "aws_subnet" "priv-sub1" {
  vpc_id                  = aws_vpc.custom-vpc.id
  cidr_block              = var.priv-sub1
  map_public_ip_on_launch = false
  availability_zone       = var.availability_zone
  tags                    = merge(var.all_tag, { Name = "Private_subnet1" })
}

resource "aws_subnet" "priv-sub2" {
  vpc_id                  = aws_vpc.custom-vpc.id
  cidr_block              = var.priv-sub2
  map_public_ip_on_launch = false
  availability_zone       = var.secondary_availability_zone
  tags                    = merge(var.all_tag, { Name = "Private_subnet2" })
}

resource "aws_internet_gateway" "custom_igw" {
  vpc_id = aws_vpc.custom-vpc.id
  tags   = merge(var.all_tag, { Name = "Public_facing_IGW" })
}

resource "aws_route_table" "custom-RT" {
  vpc_id = aws_vpc.custom-vpc.id
  tags   = merge(var.all_tag, { Name = "Internetmysq_facing_routes_allowed_in_RT" })
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.custom_igw.id
  }
}

resource "aws_route_table_association" "pubsubnet_rtassociation" {
  # tags           = merge(var.all_tag, { Name = "Public_Subnet_associtaion_RT" })
  subnet_id      = aws_subnet.pub-sub1.id
  route_table_id = aws_route_table.custom-RT.id
}
resource "aws_route_table_association" "pubsubnet2_rtassociation" {
  # tags           = merge(var.all_tag, { Name = "Public_Subnet_associtaion_RT" })
  subnet_id      = aws_subnet.pub-sub2.id
  route_table_id = aws_route_table.custom-RT.id
}

data "aws_ami" "latest_ubuntu22" {
  owners      = ["099720109477"]
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

resource "aws_instance" "demo_web" {
  instance_type          = var.ins_type
  ami                    = data.aws_ami.latest_ubuntu22.id
  vpc_security_group_ids = ["${aws_security_group.custom_SGP.id}"]
  subnet_id              = aws_subnet.pub-sub1.id
  #associate_public_ip_address = "true"
  count     = 2
  key_name  = var.key
  user_data = file("./script.sh")

  provisioner "file" {
    source      = "./ss.sql"
    destination = "/tmp/ss.sql"
  }

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ubuntu"
    private_key = file("${var.private_key_path}")
    timeout     = "4m"
  }
  tags = merge(var.all_tag, { Name = "web-app${count.index + 1}" })
}

resource "aws_security_group" "custom_SGP" {
  description = "This is the security group that we use for web-server"
  vpc_id      = aws_vpc.custom-vpc.id
  dynamic "ingress" {
    iterator = port
    for_each = var.ingress_ports
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  dynamic "egress" {
    iterator = port
    for_each = var.egress_ports
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  tags = merge(var.all_tag, { Name = "Web-Traffic-Allowing-SGP" })
}

// ###################### ALB Creation ###################

resource "aws_lb" "web-elb" {
  name               = "web-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.custom_SGP.id]
  subnets            = [aws_subnet.pub-sub1.id, aws_subnet.pub-sub2.id]
  tags               = merge(var.all_tag, { Name = "Webapp_Loadbalancer" })
}

resource "aws_lb_target_group" "web-tgp" {
  name     = "webserver-tgp"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.custom-vpc.id
  tags_all = merge(var.all_tag, { Name = "Webapp_Target_Group" })
}

resource "aws_lb_target_group_attachment" "web_target" {
  count            = 2
  target_group_arn = aws_lb_target_group.web-tgp.arn
  target_id        = element(split(",", join(",", aws_instance.demo_web.*.id)), count.index)
  port             = 80
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.web-elb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web-tgp.arn
  }
}


output "instance_pubip" {
  value = aws_instance.demo_web.*.public_ip
}
output "instance_prvip" {
  value = aws_instance.demo_web.*.private_ip
}

output "instance_name" {
  value = aws_instance.demo_web.*.tags.Name
}

output "instance_pubdns" {
  value = aws_instance.demo_web.*.public_dns
}

output "public_subnet" {
  value = aws_subnet.pub-sub1.cidr_block
}

output "private_subnet" {
  value = aws_subnet.priv-sub1.cidr_block
}

output "sgp_ingress" {
  value = aws_security_group.custom_SGP.ingress[*].from_port
}

output "sgp_egress" {
  value = aws_security_group.custom_SGP.ingress[*].to_port
}

output "sgp_id" {
  value = aws_security_group.custom_SGP.id
}

output "sgp_name" {
  value = aws_security_group.custom_SGP.name
}

output "vpc_id" {
  value = aws_vpc.custom-vpc.id
}
output "vpc_cidr" {
  value = aws_vpc.custom-vpc.cidr_block
}

output "elb_endpoint" {
  value = aws_lb.web-elb.dns_name
}

output "lb-listener" {
  value = aws_lb_listener.front_end.port
}
output "lb-listener-protocol" {
  value = aws_lb_listener.front_end.protocol
}

output "mysql_db_endpoint" {
  value = aws_db_instance.AppDBA.address
}

### Route53
output "hosted_zone_id" {
  value = aws_route53_zone.my_hosted_zone.id
}

output "cname_record_for_db" {
  value = aws_route53_record.database.name
}

output "cname_record_for_lb" {
  value = aws_route53_record.lb_ep.name
}

# // S3 outputs
# output "s3_bucket_arn" {
#   value = aws_s3_bucket.cb.arn
# }

# output "s3_bucket_name" {
#   value = aws_s3_bucket.cb.id
# }



resource "aws_route53_zone" "my_hosted_zone" {
  name = var.domain
  tags = merge(var.all_tag, { Name = "Public_Hosted_Zone" })
}

resource "aws_route53_record" "lb_ep" {
  provider = aws
  zone_id  = aws_route53_zone.my_hosted_zone.id
  name     = "example.grabtech.space"
  type     = "CNAME"
  ttl      = 300
  records  = ["${aws_lb.web-elb.dns_name}"]
}

//Note: name is pointing out the record that you wanted to create for cname records
// cname should be example.grabtech.space
// zone should be domain that we registered in route53

## Creating 'CNAME' record for RDS endpoint

resource "aws_route53_record" "database" {
  provider = aws
  zone_id  = aws_route53_zone.my_hosted_zone.id
  name     = "mysqldb.grabtech.space"
  type     = "CNAME"
  ttl      = 300
  records  = ["${aws_db_instance.AppDBA.address}"]
}

variable "region" {
  type = string
  default = "ap-south-1"
}
variable "ami_id" {
  type = string
  default = "ami-079b5e5b3971bd10d"
}
variable "instance_type" {
  type = string
  default = "t2.micro"
}
variable "key" {
  type = string
  default = "admin"
}

variable "all_tag" {
  type = map(any)
  default = {
    Owner        = "thangadurai.murugan@cae.com"
    Environment  = "Dev"
    Project      = "CloudOps Operations"
    CreationDate = "06/12/2022"
    CRNUMBER     = "CHG123456"
  }
}
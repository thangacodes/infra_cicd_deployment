variable "region" {
  type = string
  default = "ap-south-1"
}
variable "ami_id"{
  type = string
  default = "ami-079b5e5b3971bd10d"
}
variable "ins_type" {
  type = string
  default = "t2.micro"  
}
variable "key" {
  type = string
  default = "admin"
}

variable "name" {
  type = string
  default = "Web-Server"
}
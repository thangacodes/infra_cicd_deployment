variable "region" {
  type        = string
  description = "Region specific variables"
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "This is the custom vpc cidr block that we are using it for entire app deployment"
}

variable "all_tag" {
  type = map(any)
  default = {
    Owner        = "thangadurai.murugan@example.com"
    Environment  = "Developement"
    Project      = "VMware Operations"
    CreationDate = "04/22/2022"
    CRNUMBER     = "CHG123456"
  }
}

variable "pub_sub1" {
  type        = string
  default     = "10.0.1.0/24"
  description = "This is the public subnet1 cidr"
}

variable "pub_sub2" {
  type        = string
  default     = "10.0.2.0/24"
  description = "This is the public subnet2 cidr"
}

variable "priv-sub1" {
  type        = string
  default     = "10.0.3.0/24"
  description = "This is the private subnet1 cidr"
}

variable "priv-sub2" {
  type        = string
  default     = "10.0.4.0/24"
  description = "This is the private subnet2 cidr"
}

variable "ins_type" {
  type        = string
  default     = "t3.micro"
  description = "This is the instance spec"
}

variable "key" {
  type        = string
  default     = "admin"
  description = "This is the SSH_key that we use for this demo"
}

variable "availability_zone" {
  type    = string
  default = "ap-south-1a"
}
variable "secondary_availability_zone" {
  type    = string
  default = "ap-south-1b"
}

variable "password" {
  description = "Please Enter Password lenght of 5 characters!"
  type        = string
  sensitive   = true
  validation {
    condition     = length(var.password) == 5
    error_message = "Your Password must be 5 characted exactly!!!"
  }
}

################# RDS variables ##############
variable "db_uname" {
  type    = string
  default = "admin"
}
variable "db_pwd" {
  type    = string
  default = "login1-2"
}

variable "domain" {
  type    = string
  default = "grabtech.space"
}

//Private_key file variables
variable "private_key_path" {
  default = "C:/Technical/Linkedin Learning/Jenkins/04-22-2022/dev/admin.pem"
}

#######Security group ingress rules port configuration/
variable "ingress_ports" {
  type    = list(any)
  default = [22, 80, 3306]
}

variable "egress_ports" {
  type    = list(any)
  default = [0]
}

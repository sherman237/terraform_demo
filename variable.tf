variable "region" {
    description = "northwest"
    type = string
    default = "us-east-1"

}

variable "ami" {
    type = string
    default = "ami-065627b4448063f43" 
  } 

  variable "instance_name" {
    default = "terraform_test-instance-1"
    type = string
  } 

  variable "cidr_block" {
    type = string
    default = "10.0.0.0/16"
}


variable "vpc_name" {
    type =string
    default = "my_terraform_vpc"
}

variable "instance_tenancy" {
    description = "what evr "
    type = string
    default = default
}





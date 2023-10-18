resource "aws_instance" "first_instance" {
  ami           = var.ami  # Replace with your desired AMI ID
  instance_type = "t2.micro" 
  count =2  

  tags = {
    Name = "var.instance_name"
  }
}



resource "aws_s3_bucket" "example_bucket" {
  bucket = "sherman-test-bucket237" # Replace with your desired bucket name
  acl    = "public-read"            # Make the bucket publicly readable
}

resource "aws_s3_bucket_public_access_block" "example_block" {
  bucket = "shemanbucket237"
  restrict_public_buckets = false
}

resource "aws_vpc" "test" {
  cidr_block       = var.cidr_block
  instance_tenancy = var.instance_tenancy

  tags = {
    Name = var.vpc_name
  }
}



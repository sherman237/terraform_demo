resource "aws_vpc" "sample_vpc" {
  cidr_block = "182.0.0.0/16"
  tags = {
    Name  = "my_terraform_vpc"
    env   = "development"
    owner = "cyber security"
  }
}


resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.sample_vpc.id
  cidr_block = "182.0.1.0/24"
  tags = {
    Name = "terraform-subnet"
    env  = "development"
    team = "cybersecurity"
  }
}

resource "aws_route_table" "terra_RT" {
  vpc_id = aws_vpc.sample_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.sample-gateway.id

  }
  tags = {
    Name = "terra-RT"
  }
}

resource "aws_internet_gateway" "sample-gateway" {
  vpc_id = aws_vpc.sample_vpc.id
  tags = {
    Name = "terra-IGW"
  }
}

resource "aws_instance" "sample_ec2" {
  ami           = "ami-065627b4448063f43"
  subnet_id     = aws_subnet.main.id
  instance_type = "t2.micro"
  associate_public_ip_address=true
  tags = {
    Name = "application_server"

  }
}

    
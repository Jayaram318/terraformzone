resource "aws_vpc" "my_vpc" {
  cidr_block       = "192.168.0.0/16"

  tags             = {
    Name           ="from terraform"
  }
}
resource "aws_subnet" "subnet1" {
    vpc_id         = aws_vpc.my_vpc.id
    cidr_block     = "192.168.0.0/24" #implicit dependency
    tags           = {
      Name         ="sub_1"
    }
  }
resource "aws_subnet" "subnet2" {
  
  vpc_id          = aws_vpc.my_vpc.id
  cidr_block      = "192.168.1.0/24" #implicit dependency
  tags            = {
    Name          ="sub_2_from terraform"
  }
}
resource "aws_subnet" "subnet3" {
  vpc_id          = aws_vpc.my_vpc.id
  cidr_block      = "192.168.2.0/24" #implicit dependency
        tags      = {
    Name          ="subnet3_tf"
  }
}
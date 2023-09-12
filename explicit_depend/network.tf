resource "aws_vpc" "New_vpc" {
  
  cidr_block         = "192.168.0.0/16"
  tags               = {
      Name           ="from_tf_ed"
  }
}
resource "aws_subnet" "tf_1" {
  vpc_id             = aws_vpc.New_vpc.id 
  cidr_block         = "192.168.0.0/24"
  tags               = {
    Name             ="sub_1"
  }
  depends_on         = [ 
    aws_vpc.New_vpc  #explicit dependency
     ]
}
resource "aws_subnet" "tf_2" {
  vpc_id            = aws_vpc.New_vpc.id
  cidr_block        = "192.168.1.0/24"
  tags              = {
    Name            ="sub_2"
  }
  depends_on        = [ 
    aws_subnet.tf_1 # explicit depency
     ]
}
resource "aws_subnet" "tf_3" {
  vpc_id            = aws_vpc.New_vpc.id
  cidr_block        = "192.168.2.0/24"
  tags              = {
    Name            ="sub_3"
  }
  depends_on        = [ 
    aws_subnet.tf_2 # explicit depency
     ]
}
resource "aws_vpc" "main" {
  cidr_block       = var.cidr
  instance_tenancy = "default"

  tags = {
    Name = "vpc_terraform"
  }
}

resource "aws_subnet" "main" {
  count             = length(var.cidr_subnet)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.cidr_subnet[count.index]
  availability_zone = "ap-south-1a"

  tags = {
    Name = "Subnet_terraform"
  }
}


resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "gw_terraform"
  }
}

resource "aws_route_table" "my_rt" {
  vpc_id = aws_vpc.main.id
  tags = {
	Name = "RT_Terraform"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

resource "aws_route_table_association" "my_rt_assoc" {
  subnet_id      = aws_subnet.main[count.index]
  route_table_id = aws_route_table.my_rt.id
}


resource "aws_instance" "example" {
  ami           = var.my_ami
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.main[0]

  tags = {
    Name = "ec2_terraform"
  }
}

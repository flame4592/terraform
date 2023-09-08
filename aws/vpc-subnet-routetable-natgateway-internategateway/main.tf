# vpc creation

resource "aws_vpc" "main" {
 cidr_block = "10.0.0.0/16"
 enable_dns_support = "true"
 enable_dns_hostnames = "true"
 
 tags = {
   Name = "Project VPC"
 }
}

# public subnet creation

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "public-subnet"
  }
}

# create a public route table

resource "aws_route_table" "main" {
 vpc_id = aws_vpc.main.id
 
 route {
   cidr_block = "0.0.0.0/0"
   gateway_id = aws_internet_gateway.igw.id
 }
 
 tags = {
   Name = "public-rt"
 }
}

# associate public subnet with public route table

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.main.id
}

# create private subnet

resource "aws_subnet" "main_private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "private-subnet"
  }
}

# create private route table

resource "aws_route_table" "main_private" {
 vpc_id = aws_vpc.main.id
 
 route {
   cidr_block = "0.0.0.0/0"
   gateway_id = aws_nat_gateway.main.id
 }
 
 tags = {
   Name = "private-rt"
 }
}

# associate private subnet to private route table

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.main_private.id
  route_table_id = aws_route_table.main_private.id
}



resource "aws_nat_gateway" "main" {
  connectivity_type = "private"
  subnet_id         = aws_subnet.main.id
}

# create internet gateway

resource "aws_internet_gateway" "igw" {
 vpc_id = aws_vpc.main.id
 
 tags = {
   Name = "igw"
 }
}



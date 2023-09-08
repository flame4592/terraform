# This data object is going to be holding all the available availability zones in our defined region

data "aws_availability_zones" "available" {
  state = "available"
}

# creating a vpc with cidr defined in variables

resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true
  tags = {
    Name = "test-project"
  }
}

#Create an internet gateway named test and attach it to the  VPC

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "test-igw"
  }
}

# Create a group of public subnets based on the variable subnet_count.public

resource "aws_subnet" "public_main" {
  count             = var.subnet_count.public
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet_cidr_blocks[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  tags = {
    Name = "public-subnet-${count.index}"
  }
}

# Create a group of private subnets based on the variable subnet_count.private

resource "aws_subnet" "private_main" {
  count             = var.subnet_count.private
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidr_blocks[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  tags = {
    Name = "private-subnet-${count.index}"
  }
}

# Create a public route table named "public_rt"

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
}

# Here we are going to add the public subnets to the "public_rt" route table

resource "aws_route_table_association" "public" {
  count          = var.subnet_count.public
  
  route_table_id = aws_route_table.public_rt.id
  subnet_id      = 	aws_subnet.public_main[count.index].id
}

# Create a private route table named "private_rt"

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id
}

# Here we are going to add the private subnets to the route table "private_rt"
resource "aws_route_table_association" "private" {
  count          = var.subnet_count.private
  route_table_id = aws_route_table.private_rt.id
  subnet_id      = aws_subnet.private_main[count.index].id
}


# Create a security group for the RDS instances called "db_sg"
resource "aws_security_group" "db_sg" {
  name        = "db_sg"
  description = "Security group for databases"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "Allow MySQL traffic from only the web sg"
    from_port       = "3306"
    to_port         = "3306"
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

# Here we are tagging the SG with the name "db_sg"
  tags = {
    Name = "db_sg"
  }
}

# Create a db subnet group named "db_subnet_group"

resource "aws_db_subnet_group" "db_subnet_group" {
  name        = "db_subnet_group"
  description = "DB subnet group"
  subnet_ids  = [for subnet in aws_subnet.private_main : subnet.id]
}

# Create a DB instance called "database"
resource "aws_db_instance" "test_database" {
  allocated_storage      = var.settings.database.allocated_storage
  engine                 = var.settings.database.engine
  engine_version         = var.settings.database.engine_version
  instance_class         = var.settings.database.instance_class
  db_name                = var.settings.database.db_name  
  username               = var.db_username
  password               = var.db_password
  identifier             = "test-mysql-database"
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.id
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  skip_final_snapshot    = var.settings.database.skip_final_snapshot

}


# This will output the database endpoint
output "database_endpoint" {
  description = "The endpoint of the database"
  value       = aws_db_instance.test_database.address
}

# This will output the database port

output "database_port" {
  description = "The port of the database"
  value       = aws_db_instance.test_database.port
}

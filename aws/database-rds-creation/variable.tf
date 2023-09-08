#This variable is to set the AWS region that everything will be created in

variable "aws_region" {
  default = "us-east-1"
}

#This variable is to set the CIDR block for the VPC

variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

#This variable holds the number of public and private subnets

variable "subnet_count" {
  description = "Number of subnets"
  type        = map(number)
  default = {
    public  = 1,
    private = 2
  }
}

#This variable contains the configuration settings for the  RDS instances

variable "settings" {
  description = "Configuration settings"
  type        = map(any)
  default = {
    "database" = {
      allocated_storage   = 10            // storage in gigabytes
      engine              = "mysql"       // engine type
      engine_version      = "8.0.27"      // engine version
      instance_class      = "db.t2.micro" // rds instance type
      db_name             = "test_database"    // database name
      skip_final_snapshot = true
    }
  }
}

#This variable contains the CIDR blocks for the public subnet.

variable "public_subnet_cidr_blocks" {
  description = "Available CIDR blocks for public subnets"
  type        = list(string)
  default = [
    "10.0.1.0/24"
  ]
}

# This variable contains the CIDR blocks for the private subnet.

variable "private_subnet_cidr_blocks" {
  description = "Available CIDR blocks for private subnets"
  type        = list(string)
  default = [
    "10.0.2.0/24",
    "10.0.3.0/24"
  ]
}



# This variable contains the database master user We will be storing this in a secrets file
variable "db_username" {
  description = "Database master user"
  type        = string
  sensitive   = true
}

# This variable contains the database master password We will be storing this in a secrets file
variable "db_password" {
  description = "Database master user password"
  type        = string
  sensitive   = true
}
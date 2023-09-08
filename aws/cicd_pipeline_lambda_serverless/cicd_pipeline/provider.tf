terraform {
}

terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws" 
        version = "4.45.0"
        }
    }
}

# Configure the AWS Provider
provider "aws" {
    region = "${var.region}"

    # Provide Authentication Details (if any)
    # access_key = var.aws_access_key
    # secret_key = var.aws_secret_key
}

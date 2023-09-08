#  CI/CD Pipeline with Terraform for deployment on eks cluster with new iam role

This Terraform code creates a CI/CD pipeline using AWS services to automate the deployment of a serverless code from a CodeCommit repository, and triggers the pipeline when a new code is pushed to the mentioned branch of the codecommit repository.

## Prerequisites

Before you begin, make sure you have the following:

- AWS CLI configured with appropriate credentials and region / EC2 with IAM role attached.
- Terraform installed on your local machine.
- CodeCommit repository with your serverless code.

## Usage

1. go inside your directory where your code are present

3. Edit the codebuild-policy and codepipeline-policy in the terraform.tfvars file according to your requirements. This specifies the iam policies that will be attached to their specific roles. also give new role name and plicy name.

4. Change the names according to your liking.

5. Mainly edit the source-location(codecommit url), source-version(branch),repository-name(codecommit repository name) and branch-name(branch name of the codecommit repository). also go in /modeule/iam/main.tf give policy name

## Commands for execution

- terraform init
- terraform plan
- terraform apply

## Commands for destroying the built setup (only destroys the resources created through this terraform script)

- terraform destroy

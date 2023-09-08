############
#Provider
############

region           = "ap-south-1"
# lambda_zipfile    = "lambda-cicd"

############
#IAM
############

codebuild-role-name    = "codebuild-role"
codepipeline-role-name = "codepipeline-role"
lambda-bucket-name     = "disbursement-uat-artifact"

############
#Code Build
############

project-name                = "disbursement-uat-project"
project-description         = "lambda codebuild project"
project-timeout             = "10"
artifact-type               = "S3"
compute-type                = "BUILD_GENERAL1_SMALL"
image                       = "aws/codebuild/amazonlinux2-x86_64-standard:4.0"
os-type                     = "LINUX_CONTAINER"
image-pull-credentials-type = "CODEBUILD"
env-var1                    = "stage"
env-var2                    = "uat"
log-group-name              = "disbursement-uat-cicd-group"
log-stream-name             = "disbursement-uat-cicd-stream"
source-type                 = "CODECOMMIT"
source-location             = "https://git-codecommit.ap-south-1.amazonaws.com/v1/repos/disbursement_microservice"
source-version              = "master"
environment                 = "uat"

############
#Code Pipeline
############

codepipeline-name        = "lambda-pipeline"
artifact-store-type      = "S3"
repository-name          = "lambda-repo"
branch-name              = "uat"
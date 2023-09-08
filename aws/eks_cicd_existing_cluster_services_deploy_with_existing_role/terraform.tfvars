############
#Provider
############

region           = "ap-south-1"

############
#IAM
############

codebuild-role-name    = "codebuild-dev-test-cluster-deploy-role"
codepipeline-role-name = "codepipeline-dev-test-cluster-deploy-role"
codebuild-policy       = "eks-codebuild-policy"
codepipeline-policy    = "s3andcodecommit"
   
############
#Code Build
############

project-name                = "eks-cluster-deploy-test-cicd-dev-project-9"
codebuild-role-arn          = "arn:aws:iam::295719266680:role/codebuild-dev-test-cluster-deploy-role"
project-description         = "eks cluster codebuild project for dev-test"
project-timeout             = "10"
compute-type                = "BUILD_GENERAL1_SMALL"
image                       = "aws/codebuild/amazonlinux2-x86_64-standard:4.0"
os-type                     = "LINUX_CONTAINER"
image-pull-credentials-type = "CODEBUILD"
env-var1                    = "stage"
env-var2                    = "main"
source-type                 = "CODECOMMIT"
source-location             = "https://git-codecommit.us-east-1.amazonaws.com/v1/repos/test"
source-version              = "master"
environment                 = "main"

############
#Code Pipeline
############

codepipeline-name        = "test-pipeline-1"
codepipeline-role-arn    = "arn:aws:iam::295719266680:role/codepipeline-dev-test-cluster-deploy-role"
repository-name          = "test"
branch-name              = "main"


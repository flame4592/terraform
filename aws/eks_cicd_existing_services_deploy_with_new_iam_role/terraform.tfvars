############
#Provider
############

region           = "ap-south-1"

############
#IAM
############

codebuild-role-name    = "codebuild-dev-test-cluster-deploy-role"
codepipeline-role-name = "codepipeline-dev-test-cluster-deploy-role"
codebuild-policy       = [
        "lambda:CreateFunction",
        "ecr:*",
        "s3:*",
        "codebuild:*",
        "codecommit:*",
        "logs:*",
        "eks:Describe*",
        "secretsmanager:*",
	"ecr-public:*"
]
codepipeline-policy   = [
        "s3:GetObject",
        "s3:GetObjectVersion",
        "s3:GetBucketVersioning",
        "s3:PutObject",
        "s3:GetBucketPolicy",
        "s3:GetObjectAcl",
        "s3:PutObjectAcl",
        "s3:DeleteObject",
        "s3:ListBucket",
        "codebuild:BatchGetBuilds",
        "codebuild:StartBuild",
        "codecommit:GetBranch",
        "codecommit:GetCommit",
        "codecommit:GetRepository",
        "codecommit:UploadArchive",
        "codecommit:GetUploadArchiveStatus"
]
############
#Code Build
############

project-name                = "eks-cluster-deploy-test-cicd-dev-project"
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

codepipeline-name        = "test-pipeline"
repository-name          = "test"
branch-name              = "main"


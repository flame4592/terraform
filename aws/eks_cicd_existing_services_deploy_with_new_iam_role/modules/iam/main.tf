###########
#Code Build Role
###########

resource "aws_iam_role" "codebuild_role" {
    name                  = "${var.codebuild-role-name}"
    assume_role_policy    = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
        "Action": "sts:AssumeRole",
        "Principal": {
            "Service": "codebuild.amazonaws.com"
        },
        "Effect": "Allow",
        "Sid": ""
        }
    ]
}
EOF
}
data "aws_iam_policy_document" "codebuild_policy" {
    statement {
    effect = "Allow"
actions = "${var.codebuild-policy}"
resources = [
        "*",
    ]
    }
}
resource "aws_iam_policy" "codebuild_policy" {
    name        = "codebuild-dev-test-eks-cluster-policy"
    description = "Policy used in trust relationship with CodeBuild"
    policy      = data.aws_iam_policy_document.codebuild_policy.json
}
resource "aws_iam_policy_attachment" "codebuild_policy_attachment" {
    name       = "codebuild-policy-attachment"
    policy_arn = aws_iam_policy.codebuild_policy.arn
    roles      = [aws_iam_role.codebuild_role.id]
}

###########
#Code pipeline Role
###########

resource "aws_iam_role" "codepipeline_role" {
    name                  = "${var.codepipeline-role-name}"
    assume_role_policy    = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
        "Action": "sts:AssumeRole",
        "Principal": {
            "Service": "codepipeline.amazonaws.com"
        },
        "Effect": "Allow",
        "Sid": ""
        }
    ]
}
EOF
}
data "aws_iam_policy_document" "codepipeline_policy" {
    statement {
    effect = "Allow"
actions = "${var.codepipeline-policy}"
resources = [
        "*",
    ]
    }
}
resource "aws_iam_policy" "codepipeline_policy" {
    name        = "codepipeline-dev-test-eks-cluster-policy"
    description = "Policy used in trust relationship with CodePipeline"
    policy      = data.aws_iam_policy_document.codepipeline_policy.json
}
resource "aws_iam_policy_attachment" "codepipeline_policy_attachment" {
    name       = "codepipeline-policy-attachment"
    policy_arn = aws_iam_policy.codepipeline_policy.arn
    roles      = [aws_iam_role.codepipeline_role.id]
}

############
#Outputs
############

output "codebuild-role-arn" {
    value = aws_iam_role.codebuild_role.arn
}

output "codepipeline-role-arn" {
    value = aws_iam_role.codepipeline_role.arn
}


###########
#Code Build Role
###########

data "aws_iam_role" "existing_codebuild_role" {
  name = "${var.codebuild-role-name}"
}

resource "aws_iam_policy_attachment" "codebuild_policy" {
  name       = "${var.codebuild-policy}"
  policy_arn = "arn:aws:iam::295719266680:policy/eks-codebuild-policy"
  roles      = [data.aws_iam_role.existing_codebuild_role.name]
}

###########
#Code Pipeline Role
###########

data "aws_iam_role" "existing_codepipeline_role" {
  name = "${var.codepipeline-role-name}"
}

resource "aws_iam_policy_attachment" "codepipeline_policy" {
  name       = "${var.codepipeline-policy}"
  policy_arn = "arn:aws:iam::295719266680:policy/s3andcodecommit"
  roles      = [data.aws_iam_role.existing_codepipeline_role.name]
}
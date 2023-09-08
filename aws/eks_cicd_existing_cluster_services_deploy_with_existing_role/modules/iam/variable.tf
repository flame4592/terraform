variable "codebuild-role-name" {
    type = string
    description = "codebuild role name"
}

variable "codepipeline-role-name" {
    type = string
    description = "codepipeline role name"
}

variable "codebuild-policy" {
    type = string
    description = "codebuild iam policy"
}

variable "codepipeline-policy" {
    type = string
    description = "codepipeline iam policy"
}


variable "codebuild-role-name" {
    type = string
    description = "codebuild role name"
}

variable "codepipeline-role-name" {
    type = string
    description = "codepipeline role name"
}

variable "codebuild-policy" {
    type = list(string)
    description = "codebuild iam policy"
}

variable "codepipeline-policy" {
    type = list(string)
    description = "codepipeline iam policy"
}


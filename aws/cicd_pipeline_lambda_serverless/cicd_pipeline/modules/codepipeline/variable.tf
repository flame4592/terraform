variable "codebuild-project-name" {
    type = string
    description = "codebuild project name"
    default = ""
}

variable "codepipeline-name" {
    type = string
    description = "codepipeline name"
}

variable "artifact-store-type" {
    type = string
    description = "artifact storage type"
}

variable "repository-name" {
    type = string
    description = "repository name"
}

variable "branch-name" {
    type = string
    description = "branch name"
}

variable "codepipeline-role-arn" {
    type = string
    description = "codepipeline role arn"
    default = ""
}

variable "lambda-bucket" {
    type = string
    description = "lambda artifacts bucket name"
    default = ""
}
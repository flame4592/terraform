variable "project-name" {
    type = string
    description = "project name"
}

variable "project-description" {
    type = string
    description = "project description"
}

variable "lambda-bucket" {
    type = string
    description = "lambda artifacts bucket name"
    default = ""
}

variable "codebuild-role-arn" {
    type = string
    description = "codebuild role arn"
    default = ""
}

variable "project-timeout" {
    type = string
    description = "project timeout"
}

variable "artifact-type" {
    type = string
    description = "artifact type"
}

variable "compute-type" {
    type = string
    description = "compute type"
}

variable "image" {
    type = string
    description = "image"
}

variable "os-type" {
    type = string
    description = "os type"
}

variable "image-pull-credentials-type" {
    type = string
    description = "image pull credentials type"
}

variable "env-var1" {
    type = string
    description = "env-var1"
}

variable "env-var2" {
    type = string
    description = "env-var2"
}

variable "log-group-name" {
    type = string
    description = "log group name"
}

variable "log-stream-name" {
    type = string
    description = "log stream name"
}

variable "source-type" {
    type = string
    description = "source-type"
}

variable "source-location" {
    type = string
    description = "source location"
}

variable "source-version" {
    type = string
    description = "source version"
}

variable "environment" {
    type = string
    description = "environment tag"
}


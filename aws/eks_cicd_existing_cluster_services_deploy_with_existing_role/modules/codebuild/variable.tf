variable "project-name" {
    type = string
    description = "project name"
}

variable "project-description" {
    type = string
    description = "project description"
}

variable "codebuild-role-arn" {
    type = string
    description = "codebuild role arn"
}

variable "project-timeout" {
    type = string
    description = "project timeout"
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
variable "REPONAME" {
  description = "Name of the repository"
  type        = string
  default     = "test"
}

variable "YAMLFILE" {
  description = "Name of the YAML file"
  type        = string
  default     = "sample.yaml"
}

variable "CLUSTERNAME" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "test"
}

variable "ENVISTAGE" {
  description = "Environment stage"
  type        = string
  default     = "main"
}

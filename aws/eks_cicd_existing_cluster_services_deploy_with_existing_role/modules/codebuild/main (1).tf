resource "aws_codebuild_project" "codebuild_project" {
    name          = "${var.project-name}"
    description   = "${var.project-description}"
    build_timeout = "${var.project-timeout}"
    service_role  = "${var.codebuild-role-arn}"

    artifacts {
    type = "NO_ARTIFACTS"
    }

    environment {
      compute_type                = "${var.compute-type}"
      image                       = "${var.image}"
      type                        = "${var.os-type}"
      image_pull_credentials_type = "${var.image-pull-credentials-type}"
      privileged_mode             = true


      environment_variable {
        name  = "${var.env-var1}"
        value = "${var.env-var2}"
      }

      environment_variable {
        name  = "YAMLFILE"
        value = var.YAMLFILE
      }

      environment_variable {
        name  = "REPONAME"
        value = var.REPONAME
      }

      environment_variable {
        name  = "CLUSTERNAME"
        value = var.CLUSTERNAME
      }

      environment_variable {
        name  = "ENVISTAGE"
        value = var.ENVISTAGE
      }
  }



    source {
    type            = "${var.source-type}"
    location        = "${var.source-location}"
    git_clone_depth = 1
    buildspec       = file("${path.root}/buildspec.yaml")
    }

    source_version = "${var.source-version}"

    tags = {
    Environment = "${var.environment}"
    }
}


############
#Outputs
############

output "codebuild-project-name" {
    value = aws_codebuild_project.codebuild_project.name
}


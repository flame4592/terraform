resource "aws_codebuild_project" "codebuild_project" {
    name          = "${var.project-name}" 
    description   = "${var.project-description}" 
    build_timeout = "${var.project-timeout}" 
    service_role  = "${var.codebuild-role-arn}"

    artifacts {
    location = "${var.lambda-bucket}"
    type     = "${var.artifact-type}" 
    }

    environment {
    compute_type                = "${var.compute-type}" 
    image                       = "${var.image}" 
    type                        = "${var.os-type}" 
    image_pull_credentials_type = "${var.image-pull-credentials-type}" 

    environment_variable {
        name  = "${var.env-var1}" 
        value = "${var.env-var2}" 
    }

    }

    logs_config {
    cloudwatch_logs {
        group_name  = "${var.log-group-name}" 
        stream_name = "${var.log-stream-name}" 
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

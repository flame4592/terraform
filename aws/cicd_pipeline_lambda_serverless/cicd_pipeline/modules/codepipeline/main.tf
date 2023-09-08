

resource "aws_codepipeline" "codepipeline" {
    name     = "${var.codepipeline-name}" 
    role_arn = "${var.codepipeline-role-arn}"

    artifact_store {
    location = "${var.lambda-bucket}"
    type     = "${var.artifact-store-type}" 

    }

    stage {
    name = "Source"

    action {
        name             = "Source"
        category         = "Source"
        owner            = "AWS"
        provider         = "CodeCommit"
        version          = "1"
        output_artifacts = ["lambda"]

    configuration = {
        RepositoryName       = "${var.repository-name}" 
        BranchName           = "${var.branch-name}" 
        PollForSourceChanges = true
        OutputArtifactFormat = "CODEBUILD_CLONE_REF"
        }
    }
    }

    stage {
    name = "Build"

    action {
        name             = "Build"
        category         = "Build"
        owner            = "AWS"
        provider         = "CodeBuild"
        input_artifacts  = ["lambda"]
        output_artifacts = ["updated_code"]
        version          = "1"

        configuration = {
            ProjectName = "${var.codebuild-project-name}" 
        }
    }
    }

}

############
#Outputs
############

resource "aws_codepipeline" "codepipeline" {
    name     = "${var.codepipeline-name}"
    role_arn = "${var.codepipeline-role-arn}"

    artifact_store{
    location = aws_s3_bucket.codepipeline_bucket.bucket
    type     = "S3"
    }

    stage {
    name = "Source"

    action {
        name             = "Source"
        category         = "Source"
        owner            = "AWS"
        provider         = "CodeCommit"
        version          = "1"
        output_artifacts = ["sourceinpute"]

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
        input_artifacts  = ["sourceinpute"]
        output_artifacts = ["sourceoutput"]
        version          = "1"

        configuration = {
            ProjectName = "${var.codebuild-project-name}"
        }
    }
    }

}

resource "aws_s3_bucket" "codepipeline_bucket" {
    bucket = "test-eks-cluster-artifacts-bucket-1"
}


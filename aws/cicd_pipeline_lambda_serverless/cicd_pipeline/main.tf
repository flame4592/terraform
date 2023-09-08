
module "iam" {
    source = "./modules/iam/"

    codebuild-role-name    = "${var.codebuild-role-name}"
    codepipeline-role-name = "${var.codepipeline-role-name}"   
    lambda-bucket-name     = "${var.lambda-bucket-name}"
}

module "codebuild" {
    source = "./modules/codebuild/"

    project-name                = "${var.project-name}"
    project-description         = "${var.project-description}"
    lambda-bucket               = "${module.iam.lambda-bucket}"
    codebuild-role-arn          = "${module.iam.codebuild-role-arn}"
    project-timeout             = "${var.project-timeout}"
    artifact-type               = "${var.artifact-type}"
    compute-type                = "${var.compute-type}"
    image                       = "${var.image}"
    os-type                     = "${var.os-type}"
    image-pull-credentials-type = "${var.image-pull-credentials-type}"
    env-var1                    = "${var.env-var1}"
    env-var2                    = "${var.env-var2}"
    log-group-name              = "${var.log-group-name}"
    log-stream-name             = "${var.log-stream-name}"
    source-type                 = "${var.source-type}"
    source-location             = "${var.source-location}"
    source-version              = "${var.source-version}"
    environment                 = "${var.environment}"
}

module "codepipeline" {
    source = "./modules/codepipeline/"

    codepipeline-name       = "${var.codepipeline-name}"
    codebuild-project-name  = "${module.codebuild.codebuild-project-name}"
    codepipeline-role-arn   = "${module.iam.codepipeline-role-arn}"
    lambda-bucket           = "${module.iam.lambda-bucket}"
    artifact-store-type     = "${var.artifact-store-type}"
    repository-name         = "${var.repository-name}"
    branch-name             = "${var.branch-name}"
}

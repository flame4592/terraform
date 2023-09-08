module "iam" {
    source = "./modules/iam/"

    codebuild-role-name    = "${var.codebuild-role-name}"
    codepipeline-role-name = "${var.codepipeline-role-name}"
    codebuild-policy       = "${var.codebuild-policy}"
    codepipeline-policy    = "${var.codepipeline-policy}"
}

module "codebuild" {
    source = "./modules/codebuild/"

    project-name                = "${var.project-name}"
    project-description         = "${var.project-description}"
    codebuild-role-arn          = "${var.codebuild-role-arn}"
    project-timeout             = "${var.project-timeout}"
    compute-type                = "${var.compute-type}"
    image                       = "${var.image}"
    os-type                     = "${var.os-type}"
    image-pull-credentials-type = "${var.image-pull-credentials-type}"
    env-var1                    = "${var.env-var1}"
    env-var2                    = "${var.env-var2}"
    source-type                 = "${var.source-type}"
    source-location             = "${var.source-location}"
    source-version              = "${var.source-version}"
    environment                 = "${var.environment}"
    CLUSTERNAME                 = "${var.CLUSTERNAME}"
    REPONAME                    = "${var.REPONAME}"
    YAMLFILE                    = "${var.YAMLFILE}"
    ENVISTAGE                   = "${var.ENVISTAGE}"
}

module "codepipeline" {
    source = "./modules/codepipeline/"

    codepipeline-name       = "${var.codepipeline-name}"
    codebuild-project-name  = "${module.codebuild.codebuild-project-name}"
    codepipeline-role-arn   = "${var.codepipeline-role-arn}"
    repository-name         = "${var.repository-name}"
    branch-name             = "${var.branch-name}"
}


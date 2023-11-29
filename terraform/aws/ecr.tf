resource "aws_ecrpublic_repository" "techverito_backend" {
  repository_name = var.ecr_repository_backend
}

resource "aws_ecrpublic_repository" "techverito_frontend" {
  repository_name = var.ecr_repository_frontend
}

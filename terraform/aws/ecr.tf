resource "aws_ecrpublic_repository" "techverito_backend" {
  repository_name = "techverito_backend"
}

resource "aws_ecrpublic_repository" "techverito_frontend" {
  repository_name = "techverito_frontend"
}

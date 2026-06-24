resource "aws_ecr_repository" "frontend" {
  name = "proyecto-frontend"
}

resource "aws_ecr_repository" "backend_ventas" {
  name = "proyecto-backend-ventas"
}

resource "aws_ecr_repository" "backend_despachos" {
  name = "proyecto-backend-despachos"
}
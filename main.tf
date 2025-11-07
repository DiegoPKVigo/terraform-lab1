terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

# Crear una imagen de Nginx
resource "docker_image" "nginx" {
  name = "nginx:latest"
}

# Crear un contenedor a partir de la imagen
resource "docker_container" "web" {
  name  = var.name
  image = docker_image.nginx.name
  ports {
    internal = 80
    external = var.port
  }
}

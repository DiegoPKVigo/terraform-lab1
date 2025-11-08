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
# Crear una imagen de MySQL
resource "docker_image" "mysql" {
  name = "mysql:latest"
}

# Crear un contenedor a partir de la imagen de MySQL
resource "docker_container" "db" {
  name  = var.db_name
  image = docker_image.mysql.name
  env = [ "MYSQL_ROOT_PASSWORD=${var.db_password}" ]
  ports {
    internal = 3306
    external = var.db_port
  }
}

# Crear un contenedor a partir de la imagen de Nginx
resource "docker_container" "web" {
  name  = var.web_name
  image = docker_image.nginx.name
  ports {
    internal = 80
    external = var.web_port
  }

  depends_on = [docker_container.db]
}

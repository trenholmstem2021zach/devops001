terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "myfastapi" {
  name         = "myfastapi"
  keep_locally = true
}

resource "docker_container" "myfastapi" {
  image = "myfastapi"
  name  = "tutorial"
  ports {
    internal = 8000
    external = 8000
  }
}


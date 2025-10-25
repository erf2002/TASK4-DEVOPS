resource "docker_image" "python_alpine_image" {
  name         = "python:alpine"
  keep_locally = true
}

resource "docker_container" "python_alpine_container" {
  name  = "tf-python-alpine-container"
  image = docker_image.python_alpine_image.image_id

  command = ["python3", "-m", "http.server", "8000"]

  ports {
    internal = 8000
    external = 8000
  }

  restart = "always"
}

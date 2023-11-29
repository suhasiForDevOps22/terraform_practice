provider "docker" {}



resource "local_file" "batch4_file" {
  filename = "/home/ubuntu/terraform-practice/demo.txt"
  content  = "This is a file created with Terraform"

}

resource "docker_image" "nginx-img" {
	name = "nginx:latest"
	keep_locally = false 
}

resource "docker_container" "nginx-ctr" {
	name = "my-nginx-container"
	image = docker_image.nginx-img.name
	
	ports {
	internal = 80
	external =80
        } 

}


resource "local_file" "hello_world_localfile" {
  content = "Hello World from Terraform"
  filename = "${path.module}/hello_world_local.txt"
}

resource "local_file" "hello_world_globalfile" {
  content = "Hello Global from Terraform"
  filename = "${path.module}/hello_world_global.txt"
}
data "aws_ami" "ubuntu" {
  most_recent = true
  
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] 
}

variable "region" {
  type=string
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "web" {
  ami = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  tags = {
    Name = "Hello World"
    Platform = "Terraform"
  }
}
# resource "local_file" "hello_world_localfile" {
#   content = "Hello World from Terraform"
#   filename = "${path.module}/hello_world_local.txt"
# }

# resource "local_file" "hello_world_globalfile" {
#   content = "Hello Global from Terraform"
#   filename = "${path.module}/hello_world_global.txt"
# }
variable "region" {
    type = string
    description = "aws region where VM will be povisioned"
    default = "us-east-1"  
}

variable "ami" {
    type = string
    description = "aws ami used to provision the VM"
    default = "ami-0cff7528ff583bf9a"
}

variable "instance_ssh_public_key" {
  type = string
  description = "Your ssh-rsa Key"
}

data "http" "my_public_ip" {
    url = "https://ifconfig.co/json"
    request_headers = {
        Accept = "application/json"
    }
}

locals {
  my_ip = jsondecode(data.http.my_public_ip.body)
}

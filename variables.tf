
variable "region" {
  default = "us-east-1"
}

variable "ami"{

    default = "ami-b374d5a5"
}
data "aws_availability_zones" "all" {}

variable "server_port" {
  default = 8080
}

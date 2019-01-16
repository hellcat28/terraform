provider "aws"
{
  region     = "us-east-1"
}

resource "aws_eip" "ip" {
  instance = "${aws_instance.example.id}"
}
resource "aws_instance" "example" {
  ami           = "ami-b374d5a5"
  instance_type = "t2.micro"

  provisioner "local-exec" {
    command = "echo ${aws_instance.example.public_ip} > ip_address.txt"
  }
}
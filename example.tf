
provider "aws"
{
  region     =  "${var.region}"
}

resource "aws_eip" "ip" {
  instance = "${aws_instance.example.id}"
}
resource "aws_instance" "example" {
  ami           = "${lookup(var.amis,var.region)}"
  instance_type = "t2.micro"

 
}

output "ip"{
  value = "${aws_eip.ip.public_ip}"
}
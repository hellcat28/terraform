
provider "aws"
{
  region     =  "${var.region}"
}

resource "aws_eip" "ip" {
  instance = "${aws_instance.example.id}"
}
resource "aws_instance" "example" {
  ami           = "${lookup(var.amis,var.region)}"
  count =  "${var.count}"
  instance_type = "t2.micro"
  source_dest_check = false
  vpc_security_group_ids =  ["${aws_security_group.instance.id}"]
  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF
  tags {
    Name = "test"
  }
}
resource "aws_security_group" "instance" {
  name = "terraform-example-instance"
  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
output "ip"{
  value = "${aws_eip.ip.public_ip}"
}
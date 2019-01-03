provider "aws"
{
  access_key = "AKIAJFXEHDSUOSQ5Z2VA"
  secret_key = "VUBGdqzSq25hVAB4Z1rRBdk0PeDhPjpyTxLOiSjX"
  region = "us-east-1"
}
resource "aws_instance" "example"
{
  ami = "ami-40d28157"
  instance_type = "t2.micro"
  tags {
    Name = "terraform-example"
  }
 }

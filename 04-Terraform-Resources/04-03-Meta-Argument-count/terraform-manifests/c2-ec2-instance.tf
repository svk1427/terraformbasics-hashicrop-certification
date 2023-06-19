# Create EC2 Instance
resource "aws_instance" "web" {
  ami           = "ami-0889a44b331db0194" # Amazon Linux
  instance_type = "t2.micro"
  count         = 2
  tags = {
    "Name" = "web"
    #"Name" = "web-${count.index}"
  }
}

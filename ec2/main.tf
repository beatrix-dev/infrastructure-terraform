/* ------ EC2 AMAZON LINUX AMI  */

data "aws_ami" "al2023" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-2023*"] # Matches Amazon Linux 2023
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}





/* ------ EC2 Instance Config */

resource "aws_instance" "amazon_linux_instance" {
  subnet_id = aws_subnet.public_1a.id
  ami = data.aws_ami.al2023
  instance_type = "t3.micro"
  tags = {
    Name = "my-instance"
  }

}
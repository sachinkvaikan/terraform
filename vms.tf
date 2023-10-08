# main.tf

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "micro_instance_1" {
  ami           = "ami-xxxxxxxxxxxxxxxx"  # replace with the desired AMI ID
  instance_type = "t2.micro"
  count         = 2  # create two t2.micro instances
}

resource "aws_instance" "large_instance_1" {
  ami           = "ami-xxxxxxxxxxxxxxxx"  # replace with the desired AMI ID
  instance_type = "t2.large"
  count         = 1  # create one t2.large instance
}

output "micro_instance_ips" {
  value = aws_instance.micro_instance_1[*].public_ip
}

output "large_instance_ips" {
  value = aws_instance.large_instance_1[*].public_ip
}


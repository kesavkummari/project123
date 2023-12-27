provider "aws" {
  region = "us-west-2"  # Change to your preferred AWS region
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"  # Use an appropriate AMI for your region
  instance_type = "t2.micro"  # Change as needed

  tags = {
    Name = "ExampleInstance"
  }
}

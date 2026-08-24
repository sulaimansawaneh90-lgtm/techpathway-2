terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "jenkins" {
  ami           = "ami-0b6d9d3d33ba97d99"
  instance_type = "t3.micro"

  subnet_id = "subnet-0573975d708133029"

  vpc_security_group_ids = [
    "sg-03cefc5bd25685578"
  ]

  key_name = "sulaiman"

  iam_instance_profile = "TechPathway-Jenkins-EC2-Role"

  tags = {
    Name = "Techchallenge2jenkinsserver"
  }
}

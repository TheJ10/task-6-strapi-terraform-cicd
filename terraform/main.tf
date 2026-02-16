terraform {
  backend "s3" {
    bucket = "task6-strapi-terraform-state-jaspal"
    key    = "task-6/terraform.tfstate"
    region = "us-east-1"
  }
}


provider "aws" {
  region = var.aws_region
}

# -----------------------------
# Security Group
# -----------------------------
resource "aws_security_group" "strapi_sg" {
  name        = "strapi-sg"
  description = "Allow SSH and Strapi"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Strapi"
    from_port   = 1337
    to_port     = 1337
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# -----------------------------
# EC2 Instance
# -----------------------------
resource "aws_instance" "jaspal_strapi_ec2" {
  ami = "ami-0c1fe732b5494dc14"
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.strapi_sg.id]

  user_data = <<-EOF
            #!/bin/bash
            set -e

            # Update system
            dnf update -y

            # Install Docker
            dnf install -y docker

            # Start Docker
            systemctl start docker
            systemctl enable docker

            # Allow ec2-user to use Docker
            usermod -aG docker ec2-user

            # Restart Docker to apply group changes
            systemctl restart docker

            # Verification
            docker --version > /home/ec2-user/docker_installed.txt
            EOF


  tags = {
    Name = "Jaspal-Strapi-EC2"
  }
}

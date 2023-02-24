terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region =  "us-west-2"
}


resource "aws_instance" "terraform-example" {
  ami           = "ami-00b44d3dbe1f81742"
  instance_type = "t2.micro"
  user_data     = file("app.py")
  tags = {
    type = "terraform-test-instance"
  }
}

resource "aws_security_group" "sg" {
  tags = {
    type = "terraform-test-security-group"
  }
}

resource "aws_s3_bucket" "terraform-s3-bucket" {
  bucket_prefix = var.bucket_prefix
  acl = var.acl

   versioning {
    enabled = var.versioning
  }

  tags = var.tags
}

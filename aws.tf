terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

variable "grafana_key" {
  type      = string
}

provider "aws" {
  region  = "us-east-1"
#  profile = ""
}

locals {
  user_data = templatefile("userdata.yaml.tftpl", {
    installps1 = file("install.ps1")
    alloyriver = templatefile("alloy.river.tftpl", {
      grafana_key = var.grafana_key
    })
  })
}

resource "aws_instance" "win2022" {
  ami           = "ami-0f496107db66676ff"
  instance_type = "t3.small"

  key_name               = "Wrench2"
  vpc_security_group_ids = [ "sg-0c993babadd34f0d1" ]

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"               # IMDSv2
  }
  monitoring = true

  user_data = local.user_data

  tags = {
    Name = "FrankAWSWin2022"
  }
}

output "win2022"   { value = aws_instance.win2022 }
output "user_data" { value = local.user_data }

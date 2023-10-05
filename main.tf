# tf apply -target=module.ec2.aws_instance.splunk_server && sleep 5m && tf apply

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.19.0"
    }
    splunk = {
      source = "splunk/splunk"
      version = "1.4.22"
    }
  }
}

# Call ec2 module
module "ec2" {
    source = "./ec2"
}

provider "splunk" {
  url                  = "${module.ec2.instance_public_dns}:8089"
  username             = "admin"
  password             = "SPLUNK-${module.ec2.instance_id}"
  insecure_skip_verify = true
}

# Call splunk module
module "splunk" {
    source = "./splunk"
}
terraform {
  required_providers {
    splunk = {
      source = "splunk/splunk"
      version = "1.4.22"
    }
  }
}

provider "splunk" {
  url                  = "${modeule.ec2.instance_addr}"
  username             = "admin"
  password             = "SPLUNK-i-0d68b328747101671"
  insecure_skip_verify = true
}

resource "splunk_authentication_users" "user01" {
  name              = "user01"
  email             = "user01@example.com"
  password          = "password01"
  force_change_pass = false
  roles             = ["power"]
}

resource "splunk_indexes" "user01-index" {
  name                   = "user01-index"
  max_hot_buckets        = 6
  max_total_data_size_mb = 1000000
}
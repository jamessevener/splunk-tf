terraform {
  required_providers {
    splunk = {
      source = "splunk/splunk"
      version = "1.4.22"
    }
  }
}

provider "splunk" {
  url                  = "ec2-3-230-147-122.compute-1.amazonaws.com:8000"
  username             = "admin"
  password             = "SPLUNK-i-061892d108c0f14cf"
  insecure_skip_verify = true
}

resource "splunk_indexes" "user01-index" {
  name                   = "user01-index"
  max_hot_buckets        = 2
  max_total_data_size_mb = 10
}
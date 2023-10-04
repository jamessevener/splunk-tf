# Call ec2 module
module "ec2" {
    source = "./ec2"
}

# Call splunk module
module "splunk" {
    source = "./splunk"
}
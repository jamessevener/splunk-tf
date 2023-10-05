# Call ec2 module
module "ec2" {
    source = "./ec2"
    instance_addr = "${module.ec2.instance_public_dns}"
}

# Call splunk module
module "splunk" {
    source = "./splunk"
    instance_addr = "${module.ec2.instance_public_dns}"
}
variable "instance_name" {
        description = "Name of the instance to be created"
        default = "Splunk-TF"
}

variable "instance_type" {
        default = "t2.micro"
}

variable "subnet_id" {
        description = "The VPC subnet the instance(s) will be created in"
        default = "subnet-06e78a29eb05a5f29"
}

variable "ami_id" {
        description = "The AMI to use"
        default = "ami-0e40787bcd2f11bbb"
}

variable "ami_key_pair_name" {
        default = "Sevener"
}

variable "device_name" {
        default = "/dev/xvda"
}

variable "volume_size" {
        default = "30"
}

variable "volume_type" {
        default = "gp3"
}
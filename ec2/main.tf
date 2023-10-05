# Create the Splunk EC2 instance
resource "aws_instance" "splunk_server" {
    ami = "${var.ami_id}"
    subnet_id = "${var.subnet_id}"
    instance_type = "${var.instance_type}"
    key_name = "${var.ami_key_pair_name}"
    ebs_block_device {
        device_name = "${var.device_name}"
        volume_type = "${var.volume_type}"
        volume_size = "${var.volume_size}"
    }

    provisioner "file" {
        source = "web.conf"
        destination = "/opt/splunk/etc/system/local/web.conf"
    }

    connection {
        type = "ssh"
        host = self.public_ip
        user = "ec2-user"
        private_key = file("/home/jsevener/.ssh/splunk/Sevener.pem")
        timeout = "4m"

    }
}
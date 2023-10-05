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

    user_data = <<-EOF
    #!/bin/bash
    mkdir -p /opt/splunk/etc/system/local
    echo 'echo -e "[settings]\n mgmtHostPort = 0.0.0.0:8089\n [settings]\n httpport = 8000\n enableSplunkWebSSL = true\n" > /opt/splunk/etc/system/local/web.conf' | at now +3 minutes
    echo 'echo "/opt/splunk/bin/splunk restart"' | at now +9 minutes
    EOF
}
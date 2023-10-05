output "instance_public_dns" {
  description = "Public DNS address of the EC2 instance"
  value       = "http://${module.ec2.instance_public_dns}:8000"
}

output "instance_id" {
    description = "EC2 Instance ID"
    value = module.ec2.instance_id
}
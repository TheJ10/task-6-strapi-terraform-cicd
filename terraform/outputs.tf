output "ec2_public_ip" {
  description = "Public IP of EC2"
  value       = aws_instance.jaspal_strapi_ec2.public_ip
}

output "ec2_instance_id" {
  value = aws_instance.jaspal_strapi_ec2.id
}

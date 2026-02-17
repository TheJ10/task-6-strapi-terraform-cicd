variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "key_name" {
  description = "EC2 key pair name"
  type        = string
  default     = "jaspal-key"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}
variable "docker_image" {
  type = string
}

variable "admin_jwt_secret" {
  type = string
}

variable "api_token_salt" {
  type = string
}

variable "app_keys" {
  type = string
}

variable "jwt_secret" {
  type = string
}

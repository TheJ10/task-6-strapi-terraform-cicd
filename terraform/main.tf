terraform {
  backend "s3" {
    bucket = "task6-strapi-terraform-state-jaspal"
    key    = "task-6/terraform.tfstate"
    region = "us-east-1"
  }
}

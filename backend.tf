terraform {
  backend "s3" {
    bucket         = "masterterraformburrito"
    key            = "vpc/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}

terraform {
  backend "s3" {
    bucket         = "tfstate-url-shortener-084662243659"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}

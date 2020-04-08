terraform {
  backend "s3" {
    bucket = "ahares3bucket"
    profile = "default"
    key = "terraform.tfstate"
    region = "us-east-1"
  }
}

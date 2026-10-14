terraform {
  backend "s3" {
    bucket       = "gatus-380592535435-eu-west-2-tfstate"
    key          = "gatus/terraform.tfstate"
    region       = "eu-west-2"
    encrypt      = true
    use_lockfile = true
  }
}


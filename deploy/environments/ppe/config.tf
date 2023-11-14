provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      Environment = "dbs"
      Project     = "mtn"
    }
  }
}

terraform {
  required_version = ">=1.2.5"

  backend "s3" {
    bucket = "dbs-ppe-mtn-tf-state"
    key    = "technical-test-ts.state"
    region = "us-east-1"
  }
}

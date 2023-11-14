provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      Project = "mtn"
      Environment = "dbs"
    }
  }

}

terraform {
  required_version = ">=1.2.5"

  backend "s3" {
    bucket = "dbs-dev-mtn-tf-state"
    key    = "technical-test-ts.state"
    region = "us-east-1"
  }
}

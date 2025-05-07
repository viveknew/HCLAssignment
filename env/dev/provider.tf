terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
    }
    }    
    backend "s3" {
       bucket = "k9bucketforterraformk9"
       key    = "terraform.tfstate"
       region = "us-west-2"
       dynamodb_table = "dynamo_tf_lock"
    }
}

provider "aws" {
  region = "us-west-2"
}



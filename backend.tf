provider "aws" {
    region = "ca-central-1"
}

terraform {
  required_version = ">= 0.14"
    experiments      = [module_variable_optional_attrs]

  backend  "s3" {
    bucket = "dameesenebucket"
    key = "dame_tf/dev/terraform.tfstate"
    region  =   "ca-central-1"
    dynamodb_table = "tf-state-locking"
    encrypt = true


}
}

resource "aws_s3_bucket" "dame_bucket" {
    bucket = "dameesenebucket"



    lifecycle{
        prevent_destroy = true
    }
    versioning {
        enabled = true
    }
    server_side_encryption_configuration {
      rule {
        apply_server_side_encryption_by_default{
            sse_algorithm = "AES256"
        }
      }
    }
  
}

resource "aws_dynamodb_table" "tf_locks" {
    name = "tf-state-locking"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"
    attribute {
      name = "LockID"
      type = "S"
    }
  
}



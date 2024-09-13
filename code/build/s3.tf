provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "dev_s3" {
  bucket_prefix = "dev-"

  tags = {
    Environment          = "Dev"
    git_commit           = "be89f9350eedb760ed9f35ea88700c9c0efc8411"
    git_file             = "code/build/s3.tf"
    git_last_modified_at = "2024-09-13 00:57:56"
    git_last_modified_by = "mircea@neodonis.com"
    git_modifiers        = "mircea"
    git_org              = "mcocosila"
    git_repo             = "prisma-cloud-devsecops-workshop"
    yor_name             = "dev_s3"
    yor_trace            = "68722834-8fad-4f77-805b-6bdadf5abafa"
  }
}

# force a build
resource "aws_s3_bucket_ownership_controls" "dev_s3" {
  bucket = aws_s3_bucket.dev_s3.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}


module "s3_static_website" {
  source      =   "./modules/s3"
  bucket_name =   var.bucket_name
  aws_region  =   var.aws_region
}


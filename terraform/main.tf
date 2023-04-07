module "cm-s3"{
    source = "./modules/cm-s3"
    bucket_name = local.bucket_name
    cloudfront_origin_access_id = module.cm-cloudfront.cloudfront_origin_access_id
}

module "cm-route53"{
    source = "./modules/cm-route53"
    cloudfront_domain_name = module.cm-cloudfront.cloudfront_domain_name
    cloudfront_hosted_zone_id = module.cm-cloudfront.cloudfront_hosted_zone_id
    web_domain_name = local.web_domain_name
}


module "cm-cloudfront" {
  source = "./modules/cm-cloudfront"
  web_domain_name = local.web_domain_name
  origin_id_root = local.origin_id_root
  bucket_regional_domain_name = module.cm-s3.bucket_regional_domain
  s3_log_bucket_id = module.cm-s3-logging.s3_log_bucket_id

}

module "cm-s3-logging" {
  source = "./modules/cm-s3-logging"
  log_bucket_name = local.log_bucket_name
  s3_bucket_name = module.cm-s3.s3_bucket_name
}

module "cm-kms" {
  source = "./modules/cm-kms"
  s3_log_bucket_id = module.cm-s3-logging.s3_log_bucket_id
  s3_bucket_id = module.cm-s3.s3_bucket_name
  cloudfront_distribution = module.cm-cloudfront.cloudfront_distribution
}
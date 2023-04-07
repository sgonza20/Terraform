locals {
  custom_domain_name = "${var.app_name}.${var.app_hosted_zone_name}"
  web_domain_name = "web.${var.app_hosted_zone_name}"
  auth_domain_name = "auth.${var.app_hosted_zone_name}"
  callback_url = "https://${local.web_domain_name}"
  aws_account_id = data.aws_caller_identity.current.account_id
  bucket_name = "${data.aws_caller_identity.current.account_id}-webapp"
  log_bucket_name = "${data.aws_caller_identity.current.account_id}-webapp-logging"
  origin_id_root = "S3-${var.app_hosted_zone_name}"
  content_type_map = {
    html        = "text/html",
    js          = "application/javascript",
    css         = "text/css",
    svg         = "image/svg+xml",
    jpg         = "image/jpeg",
    ico         = "image/x-icon",
    png         = "image/png",
    gif         = "image/gif",
    pdf         = "application/pdf"
  }
}

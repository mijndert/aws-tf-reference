module "account" {
  source = "../../../modules/account"

  environment = "example"

  alerting_email_subscriptions = [
    "example@example.com"
  ]
}

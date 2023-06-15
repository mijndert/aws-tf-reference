module "account" {
  source = "../../../../modules/account"

  topicname   = "example-topic"

  email_subscriptions = [
    "example@example.com"
  ]
}

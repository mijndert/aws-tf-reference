module "sns_topic" {
  source  = "terraform-aws-modules/sns/aws"
  version = "~> 3.0"

  kms_master_key_id = var.kms_key_id
  name              = var.topicname
}

resource "aws_sns_topic_subscription" "email_subscription" {
  for_each  = toset(var.email_subscriptions)
  topic_arn = module.sns_topic.sns_topic_arn
  protocol  = "email"
  endpoint  = each.key
}

resource "aws_cloudwatch_event_rule" "health" {
  description   = "Notify based on health notifications"
  event_pattern = <<PATTERN
{
  "source": [
    "aws.health"
  ]
}
PATTERN
}

resource "aws_cloudwatch_event_target" "sns-alerting-aws-health" {
  arn  = module.sns_topic.sns_topic_arn
  rule = aws_cloudwatch_event_rule.health.id
}

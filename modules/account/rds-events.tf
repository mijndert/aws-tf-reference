resource "aws_db_event_subscription" "event-subscription-instance" {
  enabled     = true
  name_prefix = "instance-"
  sns_topic   = module.sns_topic.sns_topic_arn
  source_type = "db-instance"

  event_categories = [
    "availability",
    "backtrack",
    "configuration change",
    "creation",
    "deletion",
    "failover",
    "failure",
    "low storage",
    "maintenance",
    "notification",
    "read replica",
    "recovery",
    "restoration",
  ]
}

resource "aws_db_event_subscription" "event-subscription-security-group" {
  enabled     = true
  name_prefix = "security-group-"
  sns_topic   = module.sns_topic.sns_topic_arn
  source_type = "db-security-group"
}

resource "aws_db_event_subscription" "event-subscription-parameter-group" {
  enabled     = true
  name_prefix = "parameter-group-"
  sns_topic   = module.sns_topic.sns_topic_arn
  source_type = "db-parameter-group"
}

variable "topicname" {}
variable "email_subscriptions" {
  nullable    = false
  type        = list(string)
  description = "The e-mail addresses to subscribe to the SNS topic"
  default     = []
}

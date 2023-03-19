variable "role" {
  type        = string
  description = "(Required) - The name of the IAM role to which the policy should be applied"
}

variable "policy_arn" {
  type        = string
  description = "(Required) - The ARN of the policy you want to apply"
}

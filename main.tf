terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

# provider "aws" {
#   region = "us-east-1"
# }

resource "aws_budgets_budget" "monthly-budget" {
  name              = "monthly-budget2"
  budget_type       = "COST"
  limit_amount      = "200"
  limit_unit        = "USD"
  time_period_start = "2023-12-01_00:00"
  time_unit         = "MONTHLY"

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 200
    threshold_type             = "PERCENTAGE"
    notification_type          = "FORECASTED"
    subscriber_email_addresses = ["someone@somewhere.co"]
  }
}

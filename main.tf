# terraform {

#   required_providers {
#     aws = {
#       source = "hashicorp/aws"
#       #version = 
#     }
#   }
# }

# provider "aws" {
#   #nothing to put here. Everything configured with AWS CLI
# }

variable "enabled" {
  type    = bool
  default = true
}

variable "namelist" {
  type    = list(string)
  default = ["abc", "def", "ghi"]
}


variable "limit" {
  type    = number
  default = 20.59
}

variable "budget_type" {
  type    = string
  default = "COST"
}

variable "budgetname" { #this is input variable
  type        = string
  description = "Enter name of budget"
}

variable "mytuple" {
  type    = tuple([number, string, bool, list(number)])
  default = [69, "good", true, [1, 2, 3, 4]]
}

variable "myobject" {
  type    = object({ name = string, address = string, phone = number })
  default = { name = "JC", address = "somewhere", phone = 123456 }
}

variable "map" {
  type = map(any)
  default = {
    key1 = 2
    key2 = "haha"
  }
}



resource "aws_budgets_budget" "monthly-budget" {
  name              = var.budgetname
  budget_type       = var.budget_type
  limit_amount      = var.limit
  limit_unit        = "USD"
  time_period_start = "2023-12-01_00:00"
  time_unit         = "MONTHLY"

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = var.limit
    threshold_type             = "PERCENTAGE"
    notification_type          = "FORECASTED"
    subscriber_email_addresses = ["someone@somewhere.co"]
  }
}


# output "resourceid" {
#   value = aws_budgets_budget.monthly-budget.id
# }

output "whatever" {
  value = var.map["key1"]
}


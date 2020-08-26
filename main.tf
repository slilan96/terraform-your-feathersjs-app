terraform {
  backend "pg" {
  }
}

provider "heroku" {
  version = "~> 2.6.1"
  email   = var.heroku_email
  api_key = var.heroku_api_key
}

variable "heroku_email" {
  type        = string
  description = "email associated with target heroku account for your app/project"
}

variable "heroku_api_key" {
  type        = string 
  description = "api key for target heroku account"
}

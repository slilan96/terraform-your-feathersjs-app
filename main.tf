terraform {
  backend "pg" {
  }
}

provider "heroku" {
  version = "~> 2.6.1"
  email   = var.heroku_email
  api_key = var.heroku_api_key
}

resource "heroku_app" "default" {
  name   = var.feathers_app_name
  region = "eu"

  config_vars = {
    HOST     = "${var.feathers_app_name}.herokuapp.com"
    NODE_ENV = "production"
  }
}

resource "heroku_build" "default" {
  app    = heroku_app.default.name

  source = {
    path = "./sample-feathersjs-app"
  }
}

resource "heroku_addon" "database" {
  app  = heroku_app.default.name
  plan = "heroku-postgresql:hobby-dev"
}

variable "heroku_email" {
  type        = string
  description = "email associated with target heroku account for your app/project"
}

variable "heroku_api_key" {
  type        = string 
  description = "api key for target heroku account"
}

variable "feathers_app_name" {
  type = string
}

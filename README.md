# terraform-your-feathersjs-app 
**Disclaimer**: This terraform config will lead to vendor lock-in to Heroku.

This is a simple terraform config for a [Feathers JS](https://feathersjs.com/) app.
The `main.tf` file in this project is setup to use with github actions, but you
can tweak stuff to run it locally

## Setup

### Running from local CLI

#### Postgres Backend, Local execution

We set up our terraform config from the terminal, but store our state on a
remote backend

Create a heroku project and provision a postgres database. We will use this
a `postgres` backend to store the terraform state. I chose `heroku` since it's
an easy way to get a free remote database, but feel free to use another one.

Once you have your postgres db up and running, initialize terraform locally
with the following commands.

```{sh}
export DATABASE_URL=$(heroku config:get DATABASE_URL --app <your terraform heroku app name>
terraform init -backend-config="conn_str=$DATABASE_URL"
```

For some people, the above command will fail with `Error: No existing
workspaces`. You can take the following steps:

1. Run `terraform workspace new default`. Since postgres supports multiple
workspaces, we need to create one default workspace for our project
2. Run `terraform init`.

You should be good to go.

#### Setup Heroku provider and create app


### Running from CI


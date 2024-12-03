# main.tf

# Specify the provider
provider "postgresql" {
  host     = var.postgresql_host
  port     = var.postgresql_port
  username = var.postgresql_username
  password = var.postgresql_password
  database = var.postgresql_database
}

# Create a PostgreSQL user
resource "postgresql_role" "phaedrus" {
  name     = var.postgresql_role_name
  password = var.postgresql_role_password
  superuser = true
}

# Optionally, create a database for the user
resource "postgresql_database" "phaedrus_db" {
  name = var.postgresql_db_name
  owner = postgresql_role.phaedrus.name
}


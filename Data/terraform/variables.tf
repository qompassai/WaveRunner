# variables.tf
variable "postgresql_host" {
  description = "The host of the PostgreSQL server"
  type        = string
  default     = "localhost"
}

variable "postgresql_port" {
  description = "The port of the PostgreSQL server"
  type        = number
  default     = 5432
}

variable "postgresql_username" {
  description = "The username to authenticate with PostgreSQL"
  type        = string
}

variable "postgresql_password" {
  description = "The password to authenticate with PostgreSQL"
  type        = string
  sensitive   = true
}

variable "postgresql_database" {
  description = "The database to connect to"
  type        = string
  default     = "postgres"
}

variable "postgresql_role_password" {
  description = "The password for the PostgreSQL user"
  type        = string
  sensitive   = true
}

variable "postgresql_role_name" {
  description = "The name of the PostgreSQL role"
  type        = string
  default     = "phaedrus"
}

variable "postgresql_db_name" {
  description = "The name of the PostgreSQL database"
  type        = string
  default     = "phaedrus_db"
}


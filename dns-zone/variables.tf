variable "region" {
  description = "AWS region provider"
  type = string
  nullable = false
}

variable "domain" {
  description = "pre-bought domain"
  type = string
  nullable = false
}

variable "user" {
  description = "users name"
  type = string
  nullable = false
}
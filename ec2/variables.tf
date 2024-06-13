variable "region" {
  description = "AWS region provider"
  type        = string
  nullable    = false
}

variable "user" {
  description = "users name"
  type        = string
  nullable    = false
}

variable "personal_ip" {
  description = "users ip"
  type        = string
  nullable    = false
  sensitive = true
}

variable "key_name" {
  description = "ssh key name"
  type        = string
  nullable    = false
}

variable "bucket" {
  description = "State bucket"
  type        = string
  nullable    = false
}

variable "subdomain" {
  description = "Personal website subdomain"
  type        = string
  nullable    = false
}

variable "email" {
  description = "User's email"
  type        = string
  nullable    = false
}

variable "tls_enabled" {
  description = "Weather or not to enable TLS"
  type = bool
  default = false
}
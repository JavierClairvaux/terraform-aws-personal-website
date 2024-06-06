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
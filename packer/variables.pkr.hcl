variable "personal_ip" {
    type = string
    description = "Your laptop's ip"
    sensitive = true
}

variable "user" {
    type = string
    description = "User's name"
}

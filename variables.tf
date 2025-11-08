variable "db_name" {
  type    = string
  default = "db_server"
}

variable "db_password" {
  type    = string
  default = "root"
  sensitive = true
}

variable "db_port" {
  type    = number
  default = 3306
}

variable "web_name" {
  type    = string
  default = "web_server"
}

variable "web_port" {
  type    = number
  default = 8080
}

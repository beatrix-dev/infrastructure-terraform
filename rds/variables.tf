variable "storage" {
  default = 40
}

variable "databaseName" {
  default = "beatrix"
}

variable "engine" {
  default = "mysql"
}

variable "engine_version" {
  default = "8.4.3"
}

variable "instance_size" {
  default = "db.t3.micro"
}

variable "username" {
  default = "foo"
}

variable "password" {
  default = "foorbarbaz"
}

variable "parameter_group_name" {
  default = "default.mysql8.0"
}

variable "skip_final_snapshot" {
  default = true
}


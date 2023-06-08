variable "region" {
  type = string
}

variable "name" {
  type = string
}

variable "server_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "public_subnets" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "azs" {
  type = list(string)
}

variable "vpc_cidr" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "instance_ami" {
  type = string
}

variable "key_name" {
  type = string
}

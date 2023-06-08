variable "server_name" {
  type        = string
  description = "name of the ec2 instance"
}

variable "environment" {
  type        = string
  description = "environment of the ec2 instance"
}

variable "instance_type" {
  type        = string
  description = "type of the ec2 instance"
}

variable "public_subnet_id" {
  type        = string
  description = "subnet id of the ec2 instance"
}

variable "vpc_id" {
  type        = string
  description = "vpc id of the ec2 instance"
}

variable "instance_ami" {
  type        = string
  description = "ami of the ec2 instance"
}

variable "key_name" {
  type        = string
  description = "key name of the ec2 instance"
}

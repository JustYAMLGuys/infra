variable "name"{
    type = string
    description = "value of name"
}

variable "environment"{
    type = string
    description = "value of environment"
}


variable "vpc_cidr"{
    type = string
    description = "value of vpc cidr"
}

variable "azs"{
    type = list(string)
    description = "value of azs"
}

variable "private_subnets"{
    type = list(string)
    description = "value of private_subnets"
}

variable "public_subnets" {
    type = list(string)
    description = "value of public_subnets"
}
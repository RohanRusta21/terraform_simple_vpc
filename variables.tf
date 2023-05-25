variable "cidr" {
  type    = string
  default = "10.0.0.0/16"
}

output "cidr_value" {
  value = var.cidr
}


variable "cidr_subnet" {
  type    = string
  default = "10.0.1.0/24"
}

output "subnet_cidr" {
  value = var.cidr_subnet
}


variable "my_ami" {
  type    = string
  default = "ami-0f5ee92e2d63afc18"
}


output "print_ami" {
  value = var.my_ami
}

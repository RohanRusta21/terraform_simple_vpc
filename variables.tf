variable "cidr" {
  type    = string
  default = "10.0.0.0/16"
}

output "cidr_value" {
  value = var.cidr
}


variable "cidr_subnet" {
  type    = set(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

output "subnet_cidr" {
  value = join("\n", var.cidr_subnet)
}


variable "my_ami" {
  type    = string
  default = "ami-1220374627avget"
}


output "print_ami" {
  value = var.my_ami
}

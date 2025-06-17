
variable "aws_access_key" {
  type    = string
  sensitive = true
}

variable "aws_secret_key" {
  type    = string
  sensitive = true
}

variable "aws-default-region" {
  type    = string
  default = "ap-southeast-1"
}
variable "environment" {
  description = "Environment (dev, staging, prod)"
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["eu-west-1a", "eu-west-2b","eu-west-1c"]
}

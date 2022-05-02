############# AWS Variables ###################
variable "use_name_prefix" {
  description = "Creates a unique name beginning with the specified prefix. Conflicts with name"
  type        = string
  default     = null
}

variable "max_size" {
  description = "Maximum number of instance lunch"
  type        = number
  default     = 1
}
variable "min_size" {
  description = "Minimum number of instances launched"
  type        = number
  default     = 1
}

variable "desired_capacity" {
  description = "Minimum number of instances launched"
  type        = number
  default     = 1
}
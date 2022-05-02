variable "engine_name" {
  description = "Name of the db engine"
  type        = string
  default     = "mysql"
}
variable "instance_class" {
  description = "Type of the instance"
  type        = string
  default     = "db.t2.micro"
}
variable "db_name" {
  description = "Name of the database"
  type        = string
  default     = "snigdhadeb_db"
}
variable "username" {
  description = "Username of the database"
  type        = string
  default     = "snigdha"
}
variable "password" {
  description = "Password of the database"
  type        = string
  default     = "TheCloudWorld.2022"
}
variable "skip_final_snapshot" {
  description = "Final snapshot portion"
  type        = bool
  default     = true
}
variable "multi_az_deployment" {
  description = "Enable or disable multi az deployment"
  type        = bool
  default     = false
}
variable "publicly_accessible" {
  description = "Enable or disable publicly accessible"
  type        = bool
  default     = false
}
variable "delete_automated_backups" {
  description = "Enable or disable delete automated backup"
  type        = bool
  default     = false
}
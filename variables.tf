variable "region" {
  description = "Azure infrastructure region"
  type        = string
  default     = "westeurope"
}

variable "app" {
  description = "Application that we want to deploy"
  type        = string
  default     = "iot-cloud-course-lab4"
}

variable "location" {
  description = "Location short name"
  type        = string
  default     = "we"
}
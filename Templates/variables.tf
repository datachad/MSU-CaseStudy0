variable "resource_group_location" {
  default     = "eastus"
  description = "Location of the resource group."
}

variable "storage_account_location" {
  default     = "uks"
  description = "Location of the storage account."
}

variable "lasp_location" {
  default     = "uks"
  description = "Location of the London App Service plan."
}

variable "las_location" {
  default     = "uks"
  description = "Location of the London App Service."
}

variable "nyasp_location" {
  default     = "eastus"
  description = "Location of the New York App Service plan."
}

variable "nyas_location" {
  default     = "eastus"
  description = "Location of the New York App Service."
}

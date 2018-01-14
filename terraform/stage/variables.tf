variable project {
  description = "Project ID"
}

variable region {
  description = "Region"
  default     = "europe-west1"
}

variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable disk_image {
  description = "Disk image"
}

variable private_key {
  description = "Private key for connection provisioner"
}

variable zone {
  description = "Resource zone"
  default     = "europe-west1-b"
}

variable app_disk_image {
  description = "app image with ruby"
  default     = "reddit-base"
}

variable db_disk_image {
  description = "Disk image for reddit db"
  default     = "reddit-db-base"
}
variable type_server {
  default = "Type of server"
}

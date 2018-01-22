variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable app_disk_image {
  description = "Disk image"
}

variable zone {
  description = "Resource zone"
  default     = "europe-west1-b"
}

variable "name_instance" {
  description  = "Name of instance"
}

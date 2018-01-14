variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable app_disk_image {
  description = "Disk image"
}

variable private_key {
  description = "Private key for connection provisioner"
  default = "~/.ssh/appuser"
}

variable zone {
  description = "Resource zone"
  default     = "europe-west1-b"
}

variable "name_instance" {
  description  = "Name of instance"
}

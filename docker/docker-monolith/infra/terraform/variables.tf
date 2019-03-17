variable project {
  description = "project id"
}

variable region {
  description = "Region"
  default     = "europe-west1"
}
variable zone {
  description = "Zone, if var is null = us-east4-b"
  default     = "us-east4-c"
}
variable "disk-image" {
  description = "image disk for docker"
  default = "docker-host-1550990844"
}
variable ssh-user {
  description = "user for connection"
  default     = "gcp_appUser"
}
variable key-path {
  description = "Path to the public key used for ssh access"
}

variable source_ranges {
  description = "allowed IP addresses"
  default     = ["0.0.0.0/0"]
}
variable "count" {
  default = 1
}


# variable "private_key_path" {
#   description = "Path to the private key used for provision"
# }

# variable disk_image {
#   description = "Disk image"
# }

# variable "count" {
#   description = "counter"
#   default     = 1
# }

# variable "app_disk_image" {
#   description = "Disk image for reddit app"
#   default     = "reddit-ruby-base"
# }

# variable "db_disk_image" {
#   description = "Disk image for reddit app"
#   default     = "reddit-db-base"
# }

# variable "my_ip" {
#   description = "allow to connect from my network"
#   default     = "0.0.0.0/0"
# }

# variable "env_tag" {
#   description = "service tag application"
#   default = "stage"
# }

# variable "issethttp" {
#   description = "set http-server tag if needed"
#   default = ""
# }

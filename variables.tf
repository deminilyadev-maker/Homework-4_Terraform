###cloud vars


variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
  default     = "b1guusj3le769ktnpdvk"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
  default     = "b1gp1cf6qghasc85hk1g"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "db_default_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}
variable "db_default_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "DB subnet CIDR"
}
variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}
variable "db_vpc_name" {
  type        = string
  default     = "db_develop"
  description = "VPC network & subnet name"
}


###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHZyC25azetyfw72+EuFmlVfK1JNvzEXZCCsvS2qe9U2 terraform-yandex"
  description = "ssh-keygen -t ed25519"
}

### metadata 
variable "metadata" {
  type = map(object({
    serial-port-enable = number
    ssh-keys            = string
  }))

  default = {
    common = {
      serial-port-enable = 1
      ssh-keys = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHZyC25azetyfw72+EuFmlVfK1JNvzEXZCCsvS2qe9U2 terraform-yandex"
    }
  }
}
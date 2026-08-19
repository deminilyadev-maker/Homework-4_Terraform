### yandex_compute_image
variable "vm_web_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Family image title"
}


### yandex_compute_instance
variable "vm_web_platform" {
  type = object({
    name          = string
    platform_id   = string
    cores         = number
    memory        = number
    core_fraction = number
    preemptible   = bool
    nat           = bool
  })

  default = {
    name          = "netology-develop-platform-web"
    platform_id   = "standard-v3"
    cores         = 2
    memory        = 1
    core_fraction = 20
    preemptible   = true
    nat           = true
  }
}

variable "vm_db" {
  type = object({
    name          = string
    platform_id   = string
    zone          = string
    cores         = number
    memory        = number
    core_fraction = number
    preemptible   = bool
    nat           = bool
  })

  default = {
    name          = "netology-develop-platform-db"
    platform_id   = "standard-v3"
    zone          = "ru-central1-b"
    cores         = 2
    memory        = 2
    core_fraction = 20
    preemptible   = true
    nat           = true
  }
}

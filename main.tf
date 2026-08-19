resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}
resource "yandex_vpc_subnet" "develop_db" {
  name           = var.db_vpc_name
  zone           = var.db_default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.db_default_cidr
}


data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_image_family
}
resource "yandex_compute_instance" "platform" {
  name        = local.vm_web_name
  platform_id = var.vm_web_platform.platform_id

  resources {
    cores         = var.vm_web_platform.cores
    memory        = var.vm_web_platform.memory
    core_fraction = var.vm_web_platform.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_web_platform.preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.vm_web_platform.nat
  }

  metadata = var.metadata["common"]

}
resource "yandex_compute_instance" "db" {
  name        = local.vm_db_name
  platform_id = var.vm_db.platform_id
  zone        = var.vm_db.zone

  resources {
    cores         = var.vm_db.cores
    memory        = var.vm_db.memory
    core_fraction = var.vm_db.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_db.preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop_db.id
    nat       = var.vm_db.nat
  }

  metadata = var.metadata["common"]
}

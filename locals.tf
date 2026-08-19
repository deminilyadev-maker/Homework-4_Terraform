locals {
  vm_web_name = "${var.vm_web_platform.name}-${var.default_zone}"
  vm_db_name  = "${var.vm_db.name}-${var.vm_db.zone}"
}
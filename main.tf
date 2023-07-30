resource "vsphere_virtual_machine" "generic" {
  name             = var.name
  resource_pool_id = length(var.resource_pool_name) == 0 ? data.vsphere_compute_cluster.vm.resource_pool_id : var.resource_pool_name
  folder           = var.folder
  tags             = var.tags

  datastore_id = data.vsphere_datastore.vm.id

  firmware               = var.firmware
  num_cpus               = var.cpus
  memory                 = var.memory
  memory_reservation     = var.memory_reservation == "" ? (var.memory / 2) : (var.memory_reservation)
  memory_share_level     = var.memory_share_level
  enable_disk_uuid       = true
  cpu_hot_add_enabled    = var.cpu_hot_add_enabled
  memory_hot_add_enabled = var.memory_hot_add_enabled

  wait_for_guest_net_timeout = 0
  wait_for_guest_ip_timeout  = 0

  network_interface {
    network_id = data.vsphere_network.vm.id
  }

  # disk configuration for content_library item, not as robust as templates
  dynamic "disk" {
    for_each = var.content_library_name == null ? [] : [1]
    iterator = disk
    content {
      label            = length(var.disk_label) > 0 ? var.disk_label[disk.key] : "disk${disk.key}"
      size             = var.disk_size_gb[disk.key]
      unit_number      = 0
      thin_provisioned = true
    }
  }

  clone {
    template_uuid = data.vsphere_content_library_item.vm.id
  }

  vapp {
    properties = var.vapp_properties
  }

  lifecycle {
    ignore_changes = [
      clone,
      vapp,
      host_system_id,
      disk
    ]
  }
}

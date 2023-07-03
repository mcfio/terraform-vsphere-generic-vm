resource "vsphere_virtual_machine" "generic" {
  name             = var.name
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  folder           = var.folder
  tags             = var.tags

  datastore_id = data.vsphere_datastore.datastore.id

  firmware               = var.firmware
  num_cpus               = var.cpus
  memory                 = var.memory
  memory_reservation     = var.memory_reservation
  memory_share_level     = var.memory_share_level
  enable_disk_uuid       = true
  cpu_hot_add_enabled    = var.cpu_hot_add_enabled
  memory_hot_add_enabled = var.memory_hot_add_enabled

  wait_for_guest_net_timeout = 0
  wait_for_guest_ip_timeout  = 0

  network_interface {
    network_id = data.vsphere_network.network.id
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
    template_uuid = data.vsphere_content_library_item.item.id
  }

  vapp {
    properties = var.vapp_properties
  }

  lifecycle {
    ignore_changes = [
      vapp,
      host_system_id,
      disk
    ]
  }
}

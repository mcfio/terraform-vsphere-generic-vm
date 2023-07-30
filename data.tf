data "vsphere_datacenter" "vm" {
  name = var.datacenter_name
}

data "vsphere_compute_cluster" "vm" {
  name          = var.cluster_name
  datacenter_id = data.vsphere_datacenter.vm.id
}

# data "vsphere_resource_pool" "vm" {
#   name          = var.resource_pool_name
#   datacenter_id = data.vsphere_datacenter.vm.id
# }
#
data "vsphere_content_library" "vm" {
  name = var.content_library_name
}

data "vsphere_content_library_item" "vm" {
  name       = var.os_image_name
  type       = "vm-template"
  library_id = data.vsphere_content_library.vm.id
}

data "vsphere_network" "vm" {
  name          = var.network_name
  datacenter_id = data.vsphere_datacenter.vm.id
}

data "vsphere_datastore" "vm" {
  name          = var.datastore_name
  datacenter_id = data.vsphere_datacenter.vm.id
}

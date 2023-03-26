data "vsphere_datacenter" "datacenter" {
  name = var.datacenter_name
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.cluster_name
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_content_library" "content_library" {
  name = var.content_library_name
}

data "vsphere_content_library_item" "item" {
  name       = var.os_image_name
  type       = "vm-template"
  library_id = data.vsphere_content_library.content_library.id
}

data "vsphere_network" "network" {
  name          = var.network_name
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_datastore" "datastore" {
  name          = var.datastore_name
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_tag_category" "category" {
  count = var.tags != null ? length(var.tags) : 0
  name  = keys(var.tags)[count.index]
}

data "vsphere_tag" "tag" {
  count       = var.tags != null ? length(var.tags) : 0
  name        = var.tags[keys(var.tags)[count.index]]
  category_id = data.vsphere_tag_category.category[count.index].id
}


variable "name" {
  description = "Name of the vSphere Virtual Machine"
  type        = string
}

variable "datacenter_name" {
  description = "vSphere Datacenter in which to place the VM"
  type        = string
  default     = "Milton"
}

variable "cluster_name" {
  type    = string
  default = "cluster-01"
}

variable "resource_pool_name" {
  description = "vSphere Resource Pool, cluster default pool selected when unspecified"
  type        = string
  default     = ""
}

variable "folder" {
  description = "sets the vm folder"
  type        = string
  default     = null
}

variable "firmware" {
  description = "set the firmware type to either bios or efi"
  type        = string
  default     = "efi"
}

variable "cpus" {
  type    = number
  default = 1
}

variable "cpu_hot_add_enabled" {
  type    = bool
  default = null
}

variable "memory" {
  type    = number
  default = 512
}

variable "memory_reservation" {
  type    = number
  default = null
}

variable "memory_share_level" {
  type    = string
  default = "normal"
}

variable "memory_hot_add_enabled" {
  type    = bool
  default = null
}

variable "network_name" {
  type    = string
  default = "VM Network"
}

variable "disk_label" {
  type    = list(any)
  default = []
}

variable "disk_size_gb" {
  type    = list(any)
  default = null
}

variable "datastore_name" {
  type    = string
  default = "datastore1"
}

variable "content_library_name" {
  type    = string
  default = "os-images"
}

variable "os_image_name" {
  type    = string
  default = "ubuntu-latest"
}

variable "vapp_properties" {
  type    = map(any)
  default = null
}

variable "tags" {
  description = "The names of any tags to attach to this resource. They must already exist."
  type        = list(any)
  default     = null
}

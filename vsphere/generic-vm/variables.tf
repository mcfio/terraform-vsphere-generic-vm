variable "name" {
  type = string
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

variable "datacenter_name" {
  type    = string
  default = "Milton"
}

variable "cluster_name" {
  type    = string
  default = "cluster-01"
}

variable "resource_pool" {
  description = ""
  default = null
}

variable "folder" {
  type    = string
  default = null
}

variable "network_name" {
  type    = string
  default = "VM Network"
}

variable "datastore_name" {
  type    = string
  default = "datastore1"
}

variable "content_library_name" {
  type    = string
  default = "OS Image Library"
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
  type        = map(any)
  default     = null
}

variable "tag_ids" {
  description = "The ids of any tags to attach to this resource. They must already exist."
  type        = list(any)
  default     = null
}

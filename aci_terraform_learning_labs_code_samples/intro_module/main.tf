terraform {
  required_providers {
    aci = {
      source = "CiscoDevNet/aci"
    }
  }
}

# Configure the provider with your Cisco APIC credentials.
provider "aci" {
  # APIC Username
  username = var.user.username
  # APIC Password
  password = var.user.password
  # APIC URL
  url      = var.user.url
  insecure = true
}

resource "aci_vlan_pool" "example" {
  name  = "example"
  description = "From Terraform"
  alloc_mode  = "static"
  annotation  = "example"
  name_alias  = "example"
}

resource "aci_ranges" "range_1" {
  vlan_pool_dn  = aci_vlan_pool.example.id
  description   = "From Terraform"
  from          = "vlan-1"
  to            = "vlan-10"
  alloc_mode    = "inherit"
  annotation    = "example"
  name_alias    = "name_alias"
  role          = "external"
}
terraform {
  required_providers {
    grid = {
      source = "threefoldtech/grid"
    }
  }
}

# Read Security Information from Environmentvariables
variable "threefold_mnomics" {
    type        = string
    description = "Security Information"
}

variable "ssh_access_mac" {
    type        = string
    description = "ssh key from local machine"
}



provider "grid" {
    mnemonics = var.threefold_mnomics
    network = "main" # or test to use testnet
}

resource "grid_network" "net" {
    nodes = [50]
    ip_range = "10.1.0.0/16"
    name = "network"
    description = "newer network"
}

resource "grid_deployment" "m1" {
  node = 50
  network_name = grid_network.net.name
  ip_range = lookup(grid_network.net.nodes_ip_range, 50, "")
  vms {
    name = "mbhome1"
    flist = "https://hub.grid.tf/omar0.3bot/omarelawady-ubuntu-20.04.flist"
    cpu = 1
    memory = 1024
    publicip6 = true
    publicip = true
    env_vars = {
      SSH_KEY = var.ssh_access_mac 
    }

  }
}
output "node510_mbhome5_ip" {
    value = grid_deployment.m1.vms[0].ip
}
output "public_ip6" {
    value = grid_deployment.m1.vms[0].computedip6
}
output "public_ip" {
    value = grid_deployment.m1.vms[0].computedip
}


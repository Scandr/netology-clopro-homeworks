resource "yandex_vpc_gateway" "egress-gateway" {
  name = "egress-gateway"
  shared_egress_gateway {}
}

resource "yandex_vpc_route_table" "myrt" {
  network_id = "${yandex_vpc_network.mynet.id}"

#  static_route {
#    destination_prefix = "192.168.10.0/24"
#    next_hop_address   = "${yandex_compute_instance.nat01.network_interface.0.nat_ip_address}"
#  }

#  static_route {
#    destination_prefix = "192.168.10.0/24"
##    destination_prefix = "192.168.20.0/24"
#    # network_interface.0.nat_ip_address = public ip
#    # network_interface.0.ip_address = internal ip
#    next_hop_address   = "${yandex_compute_instance.nat01.network_interface.1.ip_address}"
##    next_hop_address   = "${yandex_compute_instance.vm02.network_interface.0.ip_address}"
##      gateway_id         = "${yandex_vpc_gateway.egress-gateway.id}"
#  }

  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = "${yandex_compute_instance.nat01.network_interface.0.ip_address}"
  }
}
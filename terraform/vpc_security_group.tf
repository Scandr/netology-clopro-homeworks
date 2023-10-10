#resource "yandex_vpc_security_group" "group1" {
#  name        = "My security group"
#  description = "description for my security group"
#  network_id  = "${yandex_vpc_network.mynet.id}"
#
#  labels = {
#    my-label = "my-label-value"
#  }
#
#  ingress {
#    protocol       = "ANY"
#    description    = "rule1 description"
#    v4_cidr_blocks = ["192.168.20.0/24"]
#  }
#
#  egress {
#    protocol       = "ANY"
#    description    = "rule2 description"
#    v4_cidr_blocks = ["192.168.10.0/24"]
#  }
#}
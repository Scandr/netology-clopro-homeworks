resource "yandex_vpc_network" "mynet" {
  name = "mynet"
}

resource "yandex_vpc_subnet" "public" {
  v4_cidr_blocks = ["192.168.10.0/24"]
  zone           = "ru-central1-b"
  network_id     = "${yandex_vpc_network.mynet.id}"
#  route_table_id = "${yandex_vpc_route_table.myrt.id}"
}

resource "yandex_vpc_subnet" "private" {
  v4_cidr_blocks = ["192.168.20.0/24"]
  zone           = "ru-central1-b"
  network_id     = "${yandex_vpc_network.mynet.id}"
  route_table_id = "${yandex_vpc_route_table.myrt.id}"
}
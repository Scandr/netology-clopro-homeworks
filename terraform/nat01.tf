resource "yandex_compute_instance" "nat01" {
  name        = "nat01"
  platform_id = "standard-v1"
  hostname    = "nat01.netology.yc"
  zone        = "ru-central1-b"

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd80mrhj8fl2oe87o4e1" # nat-instance-ubuntu-1559218207
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.public.id}"
    nat        = true
    ip_address = "192.168.10.254"
  }

#  network_interface {
#    subnet_id = "${yandex_vpc_subnet.private.id}"
#    nat        = true
#    ip_address = "192.168.20.254"
#  }

  metadata = {
    ssh-keys = "ubuntu:${file("/opt/yandex_cloud/id_rsa.pub")}"
  }
}

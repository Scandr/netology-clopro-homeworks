resource "yandex_compute_instance" "vm01" {
  name        = "vm01"
  platform_id = "standard-v1"
  hostname    = "vm01.netology.yc"
  zone        = "ru-central1-b"

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd8clogg1kull9084s9o" #ubuntu-22-04-lts-v20230828
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.public.id}"
    nat        = true
    ip_address = "192.168.10.10"
  }

  metadata = {
    ssh-keys = "ubuntu:${file("/opt/yandex_cloud/id_rsa.pub")}"
  }
}

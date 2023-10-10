resource "yandex_compute_instance" "vm02" {
  name        = "vm02"
  platform_id = "standard-v1"
  hostname    = "vm02.netology.yc"
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
    subnet_id = "${yandex_vpc_subnet.private.id}"
    nat        = true
    ip_address = "192.168.20.20"
  }

  metadata = {
    ssh-keys = "ubuntu:${file("/opt/yandex_cloud/id_rsa.pub")}"
  }
}

resource "google_compute_instance" "app" {

  name         = "${var.name_instance}-reddit-app"
  machine_type = "g1-small"
  zone         = "${var.zone}"

  metadata {
    sshKeys = "appuser:${file(var.public_key_path)}"
  }

  # определение загрузочного диска
  boot_disk {
    initialize_params {
      image = "${var.app_disk_image}"
    }
  }

  # определение сетевого интерфейса
  network_interface {
    # сеть, к которой присоединить данный интерфейс
    network = "default"

    # использовать ephemeral IP для доступа из Интернет
    access_config {
      nat_ip = "${google_compute_address.app_ip.address}"
    }
  }

  tags = ["reddit-app"]

}

resource "google_compute_address" "app_ip" {
  name = "${var.name_instance}-reddit-app-ip"
}

resource "google_compute_firewall" "firewall_puma" {
  name = "${var.name_instance}-allow-puma-default"

  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["9292"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["reddit-app"]
}

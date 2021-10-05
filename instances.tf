variable "web_count" {
  default = 3
  
}

resource "google_compute_instance" "web" {
  count = "${var.web_count}"
  name         = "web-${count.index}"
  machine_type = "e2-micro"
  zone         = "us-central1-a"
  tags         = ["webserver"]
  boot_disk {
    initialize_params {
      image = "centos-7-v20200403"
    }  
  }
  network_interface {
    subnetwork = google_compute_subnetwork.public.id
    access_config {}
  }
  metadata = {
    ssh-keys = "yurii:${file("~/.ssh/id_rsa.pub")}"
  }

  connection {
    type     = "ssh"
    user     = "yurii"
    private_key = "${file("~/.ssh/id_rsa")}"
    host = self.network_interface.0.access_config.0.nat_ip
    agent = false
  }
  provisioner "remote-exec" {
    inline = [
      "sudo yum install epel-release -y",
      "sudo yum install nginx -y",
      "sudo systemctl enable nginx --now",
      "sudo firewall-cmd --zone=public --permanent --add-service=http",
      "sudo firewall-cmd --reload"
    ]
  }

}
/*
resource "null_resource" "configure-webserver" {
  count = var.web_count
  connection {
    type     = "ssh"
    user     = "yurii"
    private_key = "${file("~/.ssh/id_rsa.pub")}"
    agent = true
    host = "${google_compute_instance.default.network_interface.0.access_config.0.nat_ip}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install nano -y",
      "sudo touch works.txt"
    ]
    
  }
}
*/
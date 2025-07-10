data "oci_identity_availability_domains" "ads" {
  compartment_id = var.compartment_ocid
}

# Primeira instância: aplicação + nginx
resource "oci_core_instance" "single_server" {
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  compartment_id      = var.compartment_ocid
  shape               = "VM.Standard.E2.1.Micro"


  subnet_id    = var.subnet_ocid
  display_name = "devops-app-vm"

  create_vnic_details {
    subnet_id        = var.subnet_ocid
    assign_public_ip = true
  }

  source_details {
    source_type = "image"
    source_id   = var.ubuntu_image_ocid
  }

  metadata = {
    ssh_authorized_keys = file(var.ssh_public_key_path)
    user_data           = base64encode(file("cloud-init/app-init.sh"))
  }
}

# Segunda instância: Grafana + Loki
resource "oci_core_instance" "monitor_server" {
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  compartment_id      = var.compartment_ocid
  shape               = "VM.Standard.E2.1.Micro"


  subnet_id    = var.subnet_ocid
  display_name = "devops-monitor-vm"

  create_vnic_details {
    subnet_id        = var.subnet_ocid
    assign_public_ip = true
  }

  source_details {
    source_type = "image"
    source_id   = var.ubuntu_image_ocid
  }

  metadata = {
    ssh_authorized_keys = file(var.ssh_public_key_path)
    user_data           = base64encode(file("cloud-init/app-init.sh"))
  }
}
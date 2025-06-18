variable "tenancy_ocid" {
  description = "OCID do Tenancy"
  type        = string
}

variable "user_ocid" {
  description = "OCID do usuário"
  type        = string
}

variable "compartment_ocid" {
  description = "OCID do compartimento"
  type        = string
}

variable "region" {
  description = "Região da OCI"
  type        = string
}

variable "private_key_path" {
  description = "Caminho para a chave privada"
  type        = string
}

variable "fingerprint" {
  description = "Fingerprint da chave pública registrada"
  type        = string
}

variable "ssh_public_key_path" {
  description = "Caminho para a chave pública SSH"
  type        = string
  default     = "keys/id_rsa.pub"
}

variable "subnet_ocid" {
  description = "OCID da subnet onde as instâncias serão criadas"
  type        = string
}

variable "ubuntu_image_ocid" {
  description = "OCID da imagem Ubuntu 22.04 LTS"
  type        = string
}
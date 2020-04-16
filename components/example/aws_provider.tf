provider "kubernetes" {
  config_path = local_file.kube_config.filename
}

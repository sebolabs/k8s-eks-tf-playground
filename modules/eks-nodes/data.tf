data "template_file" "cloud_init_config" {
  template = file("${path.module}/templates/cloud_init_config.tmpl")

  vars = {
    domain_name = var.private_domain_name
  }
}

data "template_file" "bootstrap_config" {
  template = file("${path.module}/templates/bootstrap_config.sh.tmpl")

  vars = {
    cluster_name       = lookup(var.cluster, "id")
    apiserver_endpoint = lookup(var.cluster, "endpoint")
    b64_cluster_ca     = lookup(var.cluster, "ca_data")
    node_labels        = join(",",lookup(var.nodes_config, "node_labels"))
  }
}

data "template_cloudinit_config" "bootstrap" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = data.template_file.cloud_init_config.rendered
  }

  part {
    content_type = "text/x-shellscript"
    content      = var.bootstrap_config_rendered != "" ? var.bootstrap_config_rendered : data.template_file.bootstrap_config.rendered
  }
}

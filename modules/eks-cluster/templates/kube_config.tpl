apiVersion: v1
clusters:
- cluster:
    server: ${cluster_server}
    certificate-authority-data: ${cluster_ca_data}
  name: kubernetes
contexts:
- context:
    cluster: kubernetes
    user: aws
  name: aws
current-context: aws
kind: Config
preferences: {}
users:
- name: aws
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1alpha1
      command: aws
      args:
      - eks
      - get-token
      - --cluster-name
      - ${cluster_name}
      - --role
      - ${provisioner_iam_role_arn}
      - --region
      - ${aws_region}

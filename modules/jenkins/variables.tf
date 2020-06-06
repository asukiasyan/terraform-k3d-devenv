variable "namespace" {
  description = "K8S namespace name"
  type        = string
}

variable "create_namespace" {
  description = "toggle k8s namespace"
  type        = bool
  default     = false
}

variable "release_name" {
  description = "Helm release name"
  type        = string
}

variable "chart_version" {
  description = "Helm chart version"
  type        = string
  default     = "2.0.0"
}



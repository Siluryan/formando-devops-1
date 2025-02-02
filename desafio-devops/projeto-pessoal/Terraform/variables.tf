# Gitlab
variable "gitlab_owner" {
  description = "gitlab owner"
  type        = string
}

variable "gitlab_token" {
  description = "gitlab token"
  type        = string
  sensitive   = true
}

variable "repository_name" {
  description = "gitlab repository name"
  type        = string
  default     = "test-provider"
}

variable "repository_visibility" {
  description = "how visible is the gitlab repo"
  type        = string
  default     = "private"
}

variable "branch" {
  description = "branch name"
  type        = string
  default     = "main"
}

variable "target_path" {
  description = "flux sync target path"
  type        = string
  default     = "staging-cluster"
}

# Kind Cluster
variable "cluster_name" {
  description = "Cluster name to create k8s cluster in Docker and set kubeconfig, You can use this cluster name select context with kubectl."
  type        = string
}

variable "node_image" {
  description = "Change base image for kubernetes cluster, This parameter allow you to use local build image."
  type        = string
  default     = "kindest/node"
}

variable "kubernetes_version" {
  description = "Specific kubernetes version to create cluster, Must specific in SemVer version. (Check all supported version -> https://hub.docker.com/r/kindest/node/tags)"
  type        = string
  default     = "1.21.14"
  validation {
    condition     = can(regex("^((([0-9]+)\\.([0-9]+)\\.([0-9]+)(?:-([0-9a-zA-Z-]+(?:\\.[0-9a-zA-Z-]+)*))?)(?:\\+([0-9a-zA-Z-]+(?:\\.[0-9a-zA-Z-]+)*))?)$", var.kubernetes_version))
    error_message = "Use SemVer to specific kubernetes version (Check all supported version -> https://hub.docker.com/r/kindest/node/tags)?"
  }
}

variable "enable_registry" {
  description = "Set to true to install image registry as docker container."
  type        = bool
  default     = false
}

variable "registry_port" {
  description = "Port of registry container."
  type        = number
  default     = 5000
}

variable "containerd_config_patches" {
  description = "Path config to existing default for containerd."
  type        = list(string)
  default     = []
}

######## Argocd server variables ########
variable "server_addr" {
  type        = string
  description = "The server address of argocd"
  default     = "localhost:32073"
}

variable "username" {
  type        = string
  description = "The Username to connect to argocd server"
  default     = "admin"
}

variable "password" {
  type        = string
  description = "The Password to connect to argocd server"
  default     = "vGiZPEnfe9wEToPc"
}

variable "insecure" {
  type        = bool
  description = "The Connection Insecure flag"
  default     = true
}

######## clusters generator variables ########
variable "clusters_generator_name" {
  type        = string
  description = "The name of applicationSet clusters generator"
  default     = "clusters-generator-ex1"
}

variable "clusters_generator_application_name" {
  type        = string
  description = "The name of application"
  default     = "{{name}}-application"
}

variable "clusters_generator_prune_enabled" {
  type = bool
  description = "prune sync policy for clusters generator applications"
  default = true
}

variable "clusters_generator_selfheal_enabled" {
  type = bool
  description = "selfHeal sync policy for clusters generator applications"
  default = true
}

variable "clusters_generator_sync_options" {
  type = list(string)
  description = "sync options of clusters generator"
  default = ["CreateNamespace=true"]
}

variable "clusters_generator_project_name" {
  type        = string
  description = "The name of project"
  default     = "default"
}

variable "clusters_generator_source_repo_url" {
  type        = string
  description = "The repository url of the source"
  default     = "https://github.com/devopshobbies/argocd-tutorial.git"
}

variable "clusters_generator_source_target_revision" {
  type        = string
  description = "The target revision of the source"
  default     = "main"
}

variable "clusters_generator_source_path" {
  type        = string
  description = "The path of the source"
  default     = "v03-argocd-applications/helm/nginx"
}

variable "clusters_generator_destination_server" {
  type        = string
  description = "The name of destination server"
  default     = "{{server}}"
}

variable "clusters_generator_destination_namespace" {
  type        = string
  description = "The name of destination namespace"
  default     = "{{name}}"
}

variable "clusters_generator_match_labels" {
  type        = map(string)
  description = "The map of labels to filter clusters"
  default = {
    "argocd.argoproj.io/secret-type" = "cluster"
  }
}

variable "clusters_generator_enabled" {
  type        = bool
  description = "enable or disable the generation of applicationSet clusters generator"
}

######## list generator variables ########
variable "list_generator_name" {
  type        = string
  description = "The name of applicationSet list generator"
  default     = "list-generator-ex1"
}

variable "list_generator_application_name" {
  type        = string
  description = "The name of application"
  default     = "{{environment}}-application"
}

variable "list_generator_prune_enabled" {
  type = bool
  description = "prune sync policy for list generator applications"
  default = true
}

variable "list_generator_selfheal_enabled" {
  type = bool
  description = "selfHeal sync policy for list generator applications"
  default = true
}

variable "list_generator_sync_options" {
  type = list(string)
  description = "sync options of list generator"
  default = ["CreateNamespace=true"]
}

variable "list_generator_project_name" {
  type        = string
  description = "The name of project"
  default     = "default"
}

variable "list_generator_source_repo_url" {
  type        = string
  description = "The repository url of the source"
  default     = "https://github.com/devopshobbies/argocd-tutorial.git"
}

variable "list_generator_source_target_revision" {
  type        = string
  description = "The target revision of the source"
  default     = "main"
}

variable "list_generator_source_path" {
  type        = string
  description = "The path of the source"
  default     = "v03-argocd-applications/{{path}}"
}

variable "list_generator_destination_server" {
  type        = string
  description = "The name of destination server"
  default     = "{{server}}"
}

variable "list_generator_destination_namespace" {
  type        = string
  description = "The name of destination namespace"
  default     = "{{environment}}"
}

variable "list_generator_elements" {
  type        = list(map(string))
  description = "The elements of the list generator"
  default = [
    {
      environment = "pre-staging"
      server      = "https://kubernetes.default.svc"
      path        = "directoryOfmanifests"
    },
    {
      environment = "staging"
      server      = "https://192.168.226.93:6443"
      path        = "helm/nginx"
    }
  ]
}

variable "list_generator_enabled" {
  type        = bool
  description = "enable or disable the generation of applicationSet list generator"
}

######## git-files generator variables ########
variable "gitFiles_generator_name" {
  type        = string
  description = "The name of applicationSet gitFiles generator"
  default     = "git-files-generator-ex1"
}

variable "gitFiles_generator_application_name" {
  type        = string
  description = "The name of application"
  default     = "{{cluster.name}}-application"
}

variable "gitFiles_generator_prune_enabled" {
  type = bool
  description = "prune sync policy for list generator applications"
  default = true
}

variable "gitFiles_generator_selfheal_enabled" {
  type = bool
  description = "selfHeal sync policy for list generator applications"
  default = true
}

variable "gitFiles_generator_sync_options" {
  type = list(string)
  description = "sync options of list generator"
  default = ["CreateNamespace=true"]
}

variable "gitFiles_generator_project_name" {
  type        = string
  description = "The name of project"
  default     = "default"
}

variable "gitFiles_generator_repo_url" {
  type        = string
  description = "The repository url of the source"
  default     = "https://github.com/devopshobbies/argocd-tutorial.git"
}

variable "gitFiles_generator_target_revision" {
  type        = string
  description = "The target revision of the source"
  default     = "main"
}

variable "gitFiles_generator_application_path" {
  type        = string
  description = "The path of the source"
  default     = "{{cluster.path}}"
}

variable "gitFiles_generator_destination_server" {
  type        = string
  description = "The name of destination server"
  default     = "{{cluster.address}}"
}

variable "gitFiles_generator_destination_namespace" {
  type        = string
  description = "The name of destination namespace"
  default     = "{{cluster.namespace}}"
}

variable "gitFiles_generator_enabled" {
  type        = bool
  description = "enable or disable the generation of applicationSet git files generator"
}

variable "gitFiles_generator_paths" {
  type = map(object({
    path = string
  }))
  default = {
    path_one = {
      path = "v09-argocd-applicationSet-1/git-generator/cluster-config/**/config.json"
    }
  }
}

######## git-directories generator variables ########
variable "gitDirectories_generator_name" {
  type        = string
  description = "The name of applicationSet gitDirectories generator"
  default     = "git-directories-generator-ex1"
}

variable "gitDirectories_generator_application_name" {
  type        = string
  description = "The name of application"
  default     = "{{path.basename}}-application"
}

variable "gitDirectories_generator_prune_enabled" {
  type = bool
  description = "prune sync policy for list generator applications"
  default = true
}

variable "gitDirectories_generator_selfheal_enabled" {
  type = bool
  description = "selfHeal sync policy for list generator applications"
  default = true
}

variable "gitDirectories_generator_sync_options" {
  type = list(string)
  description = "sync options of list generator"
  default = ["CreateNamespace=true"]
}

variable "gitDirectories_generator_project_name" {
  type        = string
  description = "The name of project"
  default     = "default"
}

variable "gitDirectories_generator_repo_url" {
  type        = string
  description = "The repository url of the source"
  default     = "https://github.com/devopshobbies/argocd-tutorial.git"
}

variable "gitDirectories_generator_target_revision" {
  type        = string
  description = "The target revision of the source"
  default     = "main"
}

variable "gitDirectories_generator_application_path" {
  type        = string
  description = "The path of the source"
  default     = "{{path}}"
}

variable "gitDirectories_generator_destination_server" {
  type        = string
  description = "The name of destination server"
  default     = "https://kubernetes.default.svc"
}

variable "gitDirectories_generator_destination_namespace" {
  type        = string
  description = "The name of destination namespace"
  default     = "{{path.basename}}-ns"
}

variable "gitDirectories_generator_enabled" {
  type        = bool
  description = "enable or disable the generation of applicationSet git directories generator"
}

variable "gitDirectories_generator_paths" {
  type = map(object({
    path    = string
    exclude = bool
  }))
  default = {
    include_path_one = {
      path    = "v09-argocd-applicationSet-1/git-generator/resources/*"
      exclude = false
    },
    exclude_path_one = {
      path    = "v09-argocd-applicationSet-1/git-generator/resources/nginx-manifests"
      exclude = true
    }
  }
}
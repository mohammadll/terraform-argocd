# In this project, we use four different generators. if you want each o them to be created in your argocd server , you need to provide the value "true" when applying. Otherwise, provide the value "false"
locals {
  clusters_generator_enabled       = var.clusters_generator_enabled
  gitDirectories_generator_enabled = var.gitDirectories_generator_enabled
  gitFiles_generator_enabled       = var.gitFiles_generator_enabled
  list_generator_enabled           = var.list_generator_enabled
}

######## Clusters Generator ########
resource "argocd_application_set" "clusters_selector" {
  count = local.clusters_generator_enabled ? 1 : 0

  metadata {
    name = var.clusters_generator_name
  }

  spec {
    generator {
      clusters {
        selector {
          match_labels = var.clusters_generator_match_labels
        }
      }
    }

    template {
      metadata {
        name = var.clusters_generator_application_name
      }

      spec {
        project = var.clusters_generator_project_name
        source {
          repo_url        = var.clusters_generator_source_repo_url
          target_revision = var.clusters_generator_source_target_revision
          path            = var.clusters_generator_source_path
        }

        destination {
          server    = var.clusters_generator_destination_server
          namespace = var.clusters_generator_destination_namespace
        }
        sync_policy {
          automated {
            prune     = var.clusters_generator_prune_enabled
            self_heal = var.clusters_generator_selfheal_enabled
          }
          sync_options = var.clusters_generator_sync_options
        }
      }
    }
  }
}

######## List Generator ########
resource "argocd_application_set" "list" {
  count = local.list_generator_enabled ? 1 : 0

  metadata {
    name = var.list_generator_name
  }

  spec {
    generator {
      list {
        elements = var.list_generator_elements
      }
    }

    template {
      metadata {
        name = var.list_generator_application_name
      }

      spec {
        project = var.list_generator_project_name
        source {
          repo_url        = var.list_generator_source_repo_url
          target_revision = var.list_generator_source_target_revision
          path            = var.list_generator_source_path
        }

        destination {
          server    = var.list_generator_destination_server
          namespace = var.list_generator_destination_namespace
        }
        sync_policy {
          automated {
            prune     = var.list_generator_prune_enabled
            self_heal = var.list_generator_selfheal_enabled
          }
          sync_options = var.list_generator_sync_options
        }
      }
    }
  }
}

######## Git Generator - Files ########
resource "argocd_application_set" "git_files" {
  count = local.gitFiles_generator_enabled ? 1 : 0

  metadata {
    name = var.gitFiles_generator_name
  }

  spec {
    generator {
      git {
        repo_url = var.gitFiles_generator_repo_url
        revision = var.gitFiles_generator_target_revision

        dynamic "file" {
          for_each = var.gitFiles_generator_paths
          content {
            path = file.value.path
          }
        }
      }
    }

    template {
      metadata {
        name = var.gitFiles_generator_application_name
      }

      spec {
        project = var.gitFiles_generator_project_name
        source {
          repo_url        = var.gitFiles_generator_repo_url
          target_revision = var.gitFiles_generator_target_revision
          path            = var.gitFiles_generator_application_path
        }

        destination {
          server    = var.gitFiles_generator_destination_server
          namespace = var.gitFiles_generator_destination_namespace
        }
        sync_policy {
          automated {
            prune     = var.gitFiles_generator_prune_enabled
            self_heal = var.gitFiles_generator_selfheal_enabled
          }
          sync_options = var.gitFiles_generator_sync_options
        }
      }
    }
  }
}

######## Git Generator - Directories ########
resource "argocd_application_set" "git_directories" {
  count = local.gitDirectories_generator_enabled ? 1 : 0

  metadata {
    name = var.gitDirectories_generator_name
  }

  spec {
    generator {
      git {
        repo_url = var.gitDirectories_generator_repo_url
        revision = var.gitDirectories_generator_target_revision

        dynamic "directory" {
          for_each = var.gitDirectories_generator_paths
          content {
            path    = directory.value.path
            exclude = directory.value.exclude
          }
        }
      }
    }

    template {
      metadata {
        name = var.gitDirectories_generator_application_name
      }

      spec {
        project = var.gitDirectories_generator_project_name
        source {
          repo_url        = var.gitDirectories_generator_repo_url
          target_revision = var.gitDirectories_generator_target_revision
          path            = var.gitDirectories_generator_application_path
        }

        destination {
          server    = var.gitDirectories_generator_destination_server
          namespace = var.gitDirectories_generator_destination_namespace
        }
        sync_policy {
          automated {
            prune     = var.gitDirectories_generator_prune_enabled
            self_heal = var.gitDirectories_generator_selfheal_enabled
          }
          sync_options = var.gitDirectories_generator_sync_options
        }
      }
    }
  }
}

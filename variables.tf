variable "ecr_map" {
  type = map(object({
    repository = optional(object({
      name = string

      encryption_configuration = optional(object({
        encryption_type = optional(string)
        kms_key         = optional(string)
      }))

      force_delete         = optional(bool)
      image_tag_mutability = optional(string)

      image_tag_mutability_exclusion_filter = optional(list(object({
        filter      = string
        filter_type = string
      })), [])

      image_scanning_configuration = optional(object({
        scan_on_push = bool
      }))

      timeouts = optional(object({
        delete = optional(string)
      }))

      region = optional(string)
      tags   = optional(map(string))
    }))

    repository_policy = optional(object({
      policy     = string
      region     = optional(string)
      repository = optional(string)
    }))

    lifecycle_policy = optional(object({
      policy                      = optional(string)
      policy_document_custom_name = optional(string)
      region                      = optional(string)
      repository                  = optional(string)
    }))

    pull_through_cache_rules = optional(map(object({
      ecr_repository_prefix      = string
      upstream_registry_url      = string
      credential_arn             = optional(string)
      custom_role_arn            = optional(string)
      region                     = optional(string)
      upstream_repository_prefix = optional(string)
    })), {})

    registry_policy = optional(object({
      policy = string
      region = optional(string)
    }))

    registry_scanning_configuration = optional(object({
      region    = optional(string)
      scan_type = string

      rule = optional(list(object({
        repository_filter = list(object({
          filter      = string
          filter_type = string
        }))

        scan_frequency = string
      })), [])
    }))

    replication_configuration = optional(object({
      region = optional(string)
      replication_configuration = object({
        rule = list(object({
          destination = list(object({
            region      = string
            registry_id = string
          }))

          repository_filter = optional(list(object({
            filter      = string
            filter_type = string
          })), [])
        }))
      })
    }))

    repository_creation_templates = optional(map(object({
      applied_for     = set(string)
      custom_role_arn = optional(string)
      description     = optional(string)
      encryption_configuration = optional(object({
        encryption_type = optional(string)
        kms_key         = optional(string)
      }))
      image_tag_mutability = optional(string)
      image_tag_mutability_exclusion_filter = optional(list(object({
        filter      = string
        filter_type = string
      })), [])
      lifecycle_policy                      = optional(string)
      lifecycle_policy_document_custom_name = optional(string)
      prefix                                = string
      region                                = optional(string)
      repository_policy                     = optional(string)
      resource_tags                         = optional(map(string))
    })), {})

    lifecycle_policy_documents = optional(map(object({
      rule = list(object({
        priority    = number
        description = optional(string)
        action = optional(object({
          type                 = string
          target_storage_class = optional(string)
        }))
        selection = object({
          count_number     = number
          count_type       = string
          count_unit       = optional(string)
          storage_class    = optional(string)
          tag_pattern_list = optional(list(string))
          tag_prefix_list  = optional(list(string))
          tag_status       = string
        })
      }))
    })), {})

    account_settings = optional(map(object({
      name   = string
      region = optional(string)
      value  = string
    })), {})

    pull_time_update_exclusions = optional(map(object({
      principal_arn = string
      region        = optional(string)
    })), {})
  }))

  description = "Keyed collection of ecr definitions"
}

variable "repository" {
  type = object({
    name = string

    encryption_configuration = optional(object({
      encryption_type = optional(string)
      # (Optional) The encryption type to use for the repository. Valid values are AES256 or KMS. Defaults to AES256.
      kms_key = optional(string)
      # (Optional) The ARN of the KMS key to use when encryption_type is KMS. If not specified, uses the default AWS managed key for ECR.
    }))

    force_delete         = optional(bool)
    image_tag_mutability = optional(string)

    image_tag_mutability_exclusion_filter = optional(list(object({
      filter      = string
      filter_type = string
    })), [])

    image_scanning_configuration = optional(object({
      scan_on_push = bool
      # (Required) Indicates whether images are scanned after being pushed to the repository (true) or not scanned (false).
    }))

    timeouts = optional(object({
      delete = optional(string)
      # (Default 20 minutes) How long to wait for a repository to be deleted.
    }))

    region = optional(string)
    tags   = optional(map(string))
  })

  default = null
}

variable "repository_policy" {
  type = object({
    policy     = string
    region     = optional(string)
    repository = optional(string)
  })

  default = null
}

variable "lifecycle_policy" {
  type = object({
    policy                      = optional(string)
    policy_document_custom_name = optional(string)
    region                      = optional(string)
    repository                  = optional(string)
  })

  default = null
}

variable "pull_through_cache_rules" {
  type = map(object({
    ecr_repository_prefix      = string
    upstream_registry_url      = string
    credential_arn             = optional(string)
    custom_role_arn            = optional(string)
    region                     = optional(string)
    upstream_repository_prefix = optional(string)
  }))

  default = {}
}

variable "registry_policy" {
  type = object({
    policy = string
    region = optional(string)
  })

  default = null
}

variable "registry_scanning_configuration" {
  type = object({
    region    = optional(string)
    scan_type = string

    rule = optional(list(object({
      repository_filter = list(object({
        filter      = string
        filter_type = string
      }))

      scan_frequency = string
    })), [])
  })

  default = null
}

variable "replication_configuration" {
  type = object({
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
  })

  default = null
}

variable "repository_creation_templates" {
  type = map(object({
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
  }))

  default = {}
}

variable "lifecycle_policy_documents" {
  type = map(object({
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
  }))

  default = {}
}

variable "account_settings" {
  type = map(object({
    name   = string
    region = optional(string)
    value  = string
  }))

  default = {}
}

variable "pull_time_update_exclusions" {
  type = map(object({
    principal_arn = string
    region        = optional(string)
  }))

  default = {}
}

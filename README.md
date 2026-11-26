<!-- markdownlint-disable -->
[![Release](https://img.shields.io/github/v/release/thecloudsolutions/terraform-aws-ecr-component?style=for-the-badge&color=6150E8)](https://github.com/thecloudsolutions/terraform-aws-ecr-component/releases)
[![Commit](https://img.shields.io/github/last-commit/thecloudsolutions/terraform-aws-ecr-component?style=for-the-badge&color=FF9800)](https://github.com/thecloudsolutions/terraform-aws-ecr-component/commits)
[![Issues](https://img.shields.io/github/issues/thecloudsolutions/terraform-aws-ecr-component?style=for-the-badge&color=BB019E)](https://github.com/thecloudsolutions/terraform-aws-ecr-component/issues)
[![Terraform](https://img.shields.io/badge/IaC-Terraform-009FD2?style=for-the-badge)](#requirements)
[![License](https://img.shields.io/github/license/thecloudsolutions/terraform-aws-ecr-component?style=for-the-badge&color=3FB950)](https://github.com/thecloudsolutions/terraform-aws-ecr-component/blob/main/LICENSE)

# terraform-aws-ecr-component

[![Cloud Solutions Banner][banner]](https://thecloudsolutions.com/)

[![Sponsor Us](https://img.shields.io/badge/sponsor_us-FF9800?style=for-the-badge)](https://github.com/sponsors/thecloudsolutions)
[![Hire Us](https://img.shields.io/badge/hire_us-009FD2?style=for-the-badge)](https://thecloudsolutions.com/contact-us)
[![Maintained By](https://img.shields.io/badge/maintained_by-Cloud_Solutions-6150E8?style=for-the-badge)](https://thecloudsolutions.com/)

## Description

Terraform component that creates and manages Amazon ECR repositories, creation templates, repository and registry policies, lifecycle policies, pull-through cache rules, scanning configuration, and replication. Supports lifecycle policy JSON generation, image tag immutability, encryption, cross-account access, account settings, and image pull time update exclusions.

## Variable Naming

In all Cloud Solutions **components** and **modules**, we intentionally use the _map suffix for input variables that accept map(object(...)).

For example:
```hcl
variable "ecr_map" {
  type        = map(object({ ... }))
  description = "Keyed collection of ecr definitions"
}
```
⚠️ This is a deliberate deviation from [Terraform Style Guide](https://developer.hashicorp.com/terraform/language/syntax/style).

We fully acknowledge that this naming convention does not follow the Terraform style guide, which recommends naming variables based on what they represent, not how they're implemented. We understand this, and want to emphasize:

1. This is a deliberate, informed decision, not an oversight.
2. Our primary goal is clarity and consistency for developers using our modules.
3. The intent is to give users immediate understanding of what kind of structure they're supplying.

### ✅ Why we made this decision (for our components and modules only)

This convention exists only within our components and modules structure. Here's why it works well for us:

1. Instant clarity for users - The _map suffix immediately signals that the variable supports multiple instances, each keyed by name. This avoids confusion around whether a variable is singular or plural.
2. Uniformity across all resources - Instead of struggling with awkward plurals (like kmses, rdses, vpcs, cloudfronts, account_managements) or inconsistent suffixes (_configs, _definitions, etc.), we use one simple, predictable pattern.
3. Avoids naming collisions - The _map suffix never conflicts with native Terraform or AWS resource types.
4. Future-proof for contributors - When contributors see _map, they can safely assume the structure is a map(object(...)) without checking variables.tf.

### 🙌 What this means for contributors

If you're contributing to Cloud Solutions components or modules, please:

1. Use the _map suffix when introducing a new map(object(...)) variable.
2. Follow the naming pattern consistently: rds_map, vpc_map, cloudfront_map, etc.
3. Don't apply this convention to Terraform projects outside components or modules - it's a local convention, not a global best practice.

If you have strong opinions or ideas for evolving this standard, you're welcome to open a discussion.

## Usage

```hcl
module "terraform-aws-ecr-component" {
  source = "git::https://github.com/thecloudsolutions/terraform-aws-ecr-component.git"
  # Cloud Solutions recommends to pin every module to a specific version
  # ?ref=x.x.x

  # Required variables
  ecr_map = {
    key = <value>
  }
}
```

> [!IMPORTANT]
> In our examples we don't pin modules to specific versions to keep the documentation aligned with the latest releases.
> However, for your own projects, we recommend to pin each module to the exact version you're using. This approach helps maintain the stability of your infrastructure.
> Additionally, adopting a structured process for version updates will help prevent unexpected changes.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.15.8 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 6.60.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ecr"></a> [ecr](#module\_ecr) | ./module | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ecr_map"></a> [ecr\_map](#input\_ecr\_map) | Keyed collection of ecr definitions | <pre>map(object({<br/>    repository = optional(object({<br/>      name = string<br/><br/>      encryption_configuration = optional(object({<br/>        encryption_type = optional(string)<br/>        kms_key         = optional(string)<br/>      }))<br/><br/>      force_delete         = optional(bool)<br/>      image_tag_mutability = optional(string)<br/><br/>      image_tag_mutability_exclusion_filter = optional(list(object({<br/>        filter      = string<br/>        filter_type = string<br/>      })), [])<br/><br/>      image_scanning_configuration = optional(object({<br/>        scan_on_push = bool<br/>      }))<br/><br/>      timeouts = optional(object({<br/>        delete = optional(string)<br/>      }))<br/><br/>      region = optional(string)<br/>      tags   = optional(map(string))<br/>    }))<br/><br/>    repository_policy = optional(object({<br/>      policy     = string<br/>      region     = optional(string)<br/>      repository = optional(string)<br/>    }))<br/><br/>    lifecycle_policy = optional(object({<br/>      policy                      = optional(string)<br/>      policy_document_custom_name = optional(string)<br/>      region                      = optional(string)<br/>      repository                  = optional(string)<br/>    }))<br/><br/>    pull_through_cache_rules = optional(map(object({<br/>      ecr_repository_prefix      = string<br/>      upstream_registry_url      = string<br/>      credential_arn             = optional(string)<br/>      custom_role_arn            = optional(string)<br/>      region                     = optional(string)<br/>      upstream_repository_prefix = optional(string)<br/>    })), {})<br/><br/>    registry_policy = optional(object({<br/>      policy = string<br/>      region = optional(string)<br/>    }))<br/><br/>    registry_scanning_configuration = optional(object({<br/>      region    = optional(string)<br/>      scan_type = string<br/><br/>      rule = optional(list(object({<br/>        repository_filter = list(object({<br/>          filter      = string<br/>          filter_type = string<br/>        }))<br/><br/>        scan_frequency = string<br/>      })), [])<br/>    }))<br/><br/>    replication_configuration = optional(object({<br/>      region = optional(string)<br/>      replication_configuration = object({<br/>        rule = list(object({<br/>          destination = list(object({<br/>            region      = string<br/>            registry_id = string<br/>          }))<br/><br/>          repository_filter = optional(list(object({<br/>            filter      = string<br/>            filter_type = string<br/>          })), [])<br/>        }))<br/>      })<br/>    }))<br/><br/>    repository_creation_templates = optional(map(object({<br/>      applied_for     = set(string)<br/>      custom_role_arn = optional(string)<br/>      description     = optional(string)<br/>      encryption_configuration = optional(object({<br/>        encryption_type = optional(string)<br/>        kms_key         = optional(string)<br/>      }))<br/>      image_tag_mutability = optional(string)<br/>      image_tag_mutability_exclusion_filter = optional(list(object({<br/>        filter      = string<br/>        filter_type = string<br/>      })), [])<br/>      lifecycle_policy                      = optional(string)<br/>      lifecycle_policy_document_custom_name = optional(string)<br/>      prefix                                = string<br/>      region                                = optional(string)<br/>      repository_policy                     = optional(string)<br/>      resource_tags                         = optional(map(string))<br/>    })), {})<br/><br/>    lifecycle_policy_documents = optional(map(object({<br/>      rule = list(object({<br/>        priority    = number<br/>        description = optional(string)<br/>        action = optional(object({<br/>          type                 = string<br/>          target_storage_class = optional(string)<br/>        }))<br/>        selection = object({<br/>          count_number     = number<br/>          count_type       = string<br/>          count_unit       = optional(string)<br/>          storage_class    = optional(string)<br/>          tag_pattern_list = optional(list(string))<br/>          tag_prefix_list  = optional(list(string))<br/>          tag_status       = string<br/>        })<br/>      }))<br/>    })), {})<br/><br/>    account_settings = optional(map(object({<br/>      name   = string<br/>      region = optional(string)<br/>      value  = string<br/>    })), {})<br/><br/>    pull_time_update_exclusions = optional(map(object({<br/>      principal_arn = string<br/>      region        = optional(string)<br/>    })), {})<br/>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ecr_repository_arns"></a> [ecr\_repository\_arns](#output\_ecr\_repository\_arns) | Full ARN of the repository. |
| <a name="output_ecr_repository_registry_ids"></a> [ecr\_repository\_registry\_ids](#output\_ecr\_repository\_registry\_ids) | The registry ID where the repository was created. |
| <a name="output_ecr_repository_repository_urls"></a> [ecr\_repository\_repository\_urls](#output\_ecr\_repository\_repository\_urls) | The URL of the repository (in the form aws\_account\_id.dkr.ecr.region.amazonaws.com/repositoryName). |
| <a name="output_ecr_repository_tags_all"></a> [ecr\_repository\_tags\_all](#output\_ecr\_repository\_tags\_all) | A map of tags assigned to the resource, including those inherited from the provider default\_tags configuration block. |
| <a name="output_ecr_repository_policy_repositories"></a> [ecr\_repository\_policy\_repositories](#output\_ecr\_repository\_policy\_repositories) | The name of the repository. |
| <a name="output_ecr_repository_policy_registry_ids"></a> [ecr\_repository\_policy\_registry\_ids](#output\_ecr\_repository\_policy\_registry\_ids) | The registry ID where the repository was created. |
| <a name="output_ecr_lifecycle_policy_repositories"></a> [ecr\_lifecycle\_policy\_repositories](#output\_ecr\_lifecycle\_policy\_repositories) | The name of the repository. |
| <a name="output_ecr_lifecycle_policy_registry_ids"></a> [ecr\_lifecycle\_policy\_registry\_ids](#output\_ecr\_lifecycle\_policy\_registry\_ids) | The registry ID where the repository was created. |
| <a name="output_ecr_pull_through_cache_rule_registry_ids"></a> [ecr\_pull\_through\_cache\_rule\_registry\_ids](#output\_ecr\_pull\_through\_cache\_rule\_registry\_ids) | The registry ID where the repository was created. |
| <a name="output_ecr_registry_policy_registry_ids"></a> [ecr\_registry\_policy\_registry\_ids](#output\_ecr\_registry\_policy\_registry\_ids) | The registry ID where the registry was created. |
| <a name="output_ecr_registry_scanning_configuration_registry_ids"></a> [ecr\_registry\_scanning\_configuration\_registry\_ids](#output\_ecr\_registry\_scanning\_configuration\_registry\_ids) | The registry ID the scanning configuration applies to. |
| <a name="output_ecr_replication_configuration_registry_ids"></a> [ecr\_replication\_configuration\_registry\_ids](#output\_ecr\_replication\_configuration\_registry\_ids) | The registry ID where the replication configuration was created. |
| <a name="output_ecr_repository_names"></a> [ecr\_repository\_names](#output\_ecr\_repository\_names) | Names of the repositories. |
| <a name="output_ecr_repository_creation_template_registry_ids"></a> [ecr\_repository\_creation\_template\_registry\_ids](#output\_ecr\_repository\_creation\_template\_registry\_ids) | Registry IDs the repository creation templates apply to. |
| <a name="output_ecr_repository_creation_template_prefixes"></a> [ecr\_repository\_creation\_template\_prefixes](#output\_ecr\_repository\_creation\_template\_prefixes) | Repository name prefixes matched by the templates. |
| <a name="output_ecr_lifecycle_policy_document_jsons"></a> [ecr\_lifecycle\_policy\_document\_jsons](#output\_ecr\_lifecycle\_policy\_document\_jsons) | Lifecycle policies rendered as JSON documents. |
| <a name="output_ecr_account_setting_names"></a> [ecr\_account\_setting\_names](#output\_ecr\_account\_setting\_names) | Names of the account settings. |
| <a name="output_ecr_account_setting_values"></a> [ecr\_account\_setting\_values](#output\_ecr\_account\_setting\_values) | Values of the account settings. |
| <a name="output_ecr_pull_time_update_exclusion_principal_arns"></a> [ecr\_pull\_time\_update\_exclusion\_principal\_arns](#output\_ecr\_pull\_time\_update\_exclusion\_principal\_arns) | ARNs of IAM principals excluded from image pull-time updates. |

## Quick Start

The project is under active development, and we welcome all contributors! 🎉
  
Before you start, please review our [Contributor Guidelines](https://github.com/thecloudsolutions/.github/blob/main/CONTRIBUTING.md) to understand the expectations and processes.
  
Follow these steps to get started:
  
---
  
### 1. **Fork the Repository**
- Click the **"Fork"** button on the repository's GitHub page to create a copy under your GitHub account.

> [!TIP]
> If you're new to GitHub, check out the [GitHub Docs](https://docs.github.com/en/get-started) to familiarize yourself with key concepts like forking, branching, and pull requests.
  
### 2. **Clone the Fork**
- Clone your fork to your local machine using:
  ```bash
  git clone https://github.com/<your-username>/<repository-name>.git
  ```
  
### 3. **Create a Branch**
- Create a new branch for your contribution:
  ```bash
  git checkout -b your-feature-name
  ```
  
### 4. **Make Changes**
- Implement your changes in the codebase.
- Ensure you follow the project's style guide and standards.
  
> [!WARNING]
> Always adhere to the project's coding standards and best practices outlined in the [CONTRIBUTING.md](https://github.com/thecloudsolutions/.github/blob/main/CONTRIBUTING.md) file.
    
### 5. **Test Your Changes**
- Run tests to verify your changes locally.
- Follow any project-specific testing instructions.
    
### 6. **Commit Your Changes**
- Stage and commit your changes with a clear and concise message:
  ```bash
  git add .
  git commit -m "Add description of the change"
  ```

> [!NOTE]
> Use meaningful commit messages in the present tense (e.g., "Add feature X" instead of "Added feature X").
  
### 7. **Push Your Branch**
- Push your branch to your fork:
  ```bash
  git push origin your-feature-name
  ```
    
### 8. **Open a Pull Request (PR)**
- Navigate to the original repository and click the **"New Pull Request"** button.
- Select your branch and submit your PR following the [Pull Request template](https://github.com/thecloudsolutions/.github/blob/main/.github/PULL_REQUEST_TEMPLATE/pull_request_template.md).
- Use keywords like `Closes #123` to link your PR to a related issue.
  
### **🎉 Congratulations, you’ve made your first contribution! 🎉**  
We appreciate your effort and look forward to reviewing your work.

## About Us

**Cloud Solutions: Innovating Open Source for AWS & DevOps**

Cloud Solutions creates and maintains free, open-source tools to help startups thrive in the AWS Cloud and DevOps space. Our mission is to make advanced technology accessible to businesses of all sizes.

With years of experience and a commitment to innovation, we design solutions that simplify workflows, encourage collaboration, and drive growth - removing cost barriers along the way. Every contribution brings us closer to a future where technology empowers all.

Your support makes everything we do possible.

Thank you for being part of our journey to empower innovation and build a stronger Open Source future!

## Contributing

The project is under active development, and we welcome all contributors! 🎉 

Before you start, please review our [Contributor Guidelines](CONTRIBUTING.md) to understand the expectations and processes.

## Blog

Link to our [blog](https://thecloudsolutions.com/blog), where you can explore in-depth articles. Gain valuable insights and expert analysis on AWS cloud solution strategies and trends.

## License

The project is 100% Open Source and licensed under the [APACHE2](LICENSE).

## Trademarks

All other trademarks referenced herein are the property of their respective owners.

## Copyrights

Copyright © 2020-2026 [Cloud Solutions](https://thecloudsolutions.com)

[banner]: https://github.com/thecloudsolutions/.github/blob/main/profile/banner.png
terraform {
  backend "http" {
    address        = "https://api.abbey.io/terraform-http-backend"
    lock_address   = "https://api.abbey.io/terraform-http-backend/lock"
    unlock_address = "https://api.abbey.io/terraform-http-backend/unlock"
    lock_method    = "POST"
    unlock_method  = "POST"
  }

  required_providers {
    abbey = {
      source = "abbeylabs/abbey"
      version = "0.2.4"
    }
  }
}



provider "abbey" {
  # Configuration options
  bearer_auth = var.abbey_token
}

resource "random_string" "random_suffix" {
  length = 4
  special = false
  upper = false
}

resource "abbey_grant_kit" "doug_full_site" {
  name = "Abbey_Demo_Site_full_access9"
  description = <<-EOT
    Grants full access to doug sillars repo.
  EOT

  workflow = {
    steps = [
      {
        reviewers = {
          one_of = ["doug.sillars@gmail.com"] # CHANGEME
        }
      }
    ]
  }

  policies = [
    { bundle = "github://dougsillars/abbey-starter-kit-quickstart/policies" } # CHANGEME
  ]

  output = {
    # Replace with your own path pointing to where you want your access changes to manifest.
    # Path is an RFC 3986 URI, such as `github://{organization}/{repo}/path/to/file.tf`.
    location = "github://dougsillars/abbey-starter-kit-quickstart/access.tf" # CHANGEME
    append = <<-EOT
      resource "abbey_demo" "grant_read_write_access_${local.sanitized_email}" {
        permission = "read_write"
        email = "{{ .data.system.abbey.identities.abbey.email }}"
      }
    EOT
  }
}


locals {
  email = "{{.data.system.abbey.identities.abbey.email}}"
  sanitized_email = replace(local.email, "[^a-zA-Z]", "")
}

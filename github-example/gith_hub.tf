terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "4.18.2"
    }
  }
}

provider "github" {
  # Configuration options
  token = "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"
}
resource "github_repository" "jay-terraform" {
  name       = "jay-terraform"
  visibility = "private"
}

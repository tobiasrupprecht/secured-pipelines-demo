variable "oauth_token_id" {}
provider tfe {
}

resource "tfe_team" "secured-pipeline-project" {
  name         = var.project_name
  organization = var.tfe_organization
  visibility   = "secret"
  organization_access {
    manage_vcs_settings = false
    manage_policies     = false
    manage_workspaces   = false
  }
}

resource "tfe_workspace" "secured-pipeline-project" {
  name                          = var.project_name
  organization                  = var.tfe_organization
  structured_run_output_enabled = false
}

resource "tfe_team_access" "secured-pipeline-project" {
  access       = "write"
  team_id      = tfe_team.secured-pipeline-project.id
  workspace_id = tfe_workspace.secured-pipeline-project.id
}

resource "tfe_policy_set" "terraform-version" {
  name          = "terraform-version"
  description   = "Checking the terraform version"
  organization  = var.tfe_organization
  policies_path = "sentinel/"
  workspace_ids = [tfe_workspace.secured-pipeline-project.id]

  vcs_repo {
    identifier         = "tobiasrupprecht/secured-pipelines-demo"
    branch             = "main"
    ingress_submodules = false
    oauth_token_id     = var.oauth_token_id
  }
}

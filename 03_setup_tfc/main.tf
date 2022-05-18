# TFE_TOKEN set as environment variable
provider "tfe" {
}

# Using an existing org as this is TFC; can be replaced with code to create an org if TFE is being used.
data "tfe_organization" "hashicorp-tobiasrupprecht" {
  name = "hashicorp-tobiasrupprecht"
}

resource "local_file" "org" {
    content  = data.tfe_organization.hashicorp-tobiasrupprecht.name
    filename = "temp_data/tfc_org_name"
}


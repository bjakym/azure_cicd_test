#############################################################################
# VARIABLES
#############################################################################

variable "location" {
  type    = string
  default = "North Europe"
}

variable "naming_prefix" {
  type    = string
  default = "kstp"
}

variable "github_repository" {
  type    = string
  default = "azure_cicd_test"
}

variable "res_group" {
  type    = string
  default = "kstp-grp"
}
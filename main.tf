##TF state
terraform {
 backend "gcs" {
   bucket  = "tfstate-challenge"
   prefix  = "terraform/state"
 }
}

# Calling module

module "devops_challenge" {
  source     = "./challenge_module"
  project_id = "devops-challenge-357700"
  region     = "us-central1"
}
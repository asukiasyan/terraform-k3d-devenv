module "jenkins" {
  source = "../../../modules/jenkins"
  create_namespace = true
  namespace = "jenkins"
  release_name = "jenkins"
}

module "name_spaces" {
  source = "./namesspaces"
}

module "build_namespace" {
  source = "./namesspaces/build"
}

module "dev_namespace" {
  source = "./namesspaces/dev"
}

module "test_namespace" {
  source = "./namesspaces/test"
}
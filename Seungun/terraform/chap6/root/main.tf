module "mypw1" {
  source = "../modules/random-pwgen"
}

module "mypw2" {
  source = "../modules/random-pwgen"
  isDB = true
}

output "mypw1" {
  value = module.mypw1
}

output "mypw2" {
  value = module.mypw2
}

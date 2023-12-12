output "dev_instance_ip" {
  value = module.dev_instance.instance_ip
}

output "staging_instance_ip" {
  value = module.staging_instance.instance_ip
}

output "prod_instance_ip" {
  value = module.prod_instance.instance_ip
}

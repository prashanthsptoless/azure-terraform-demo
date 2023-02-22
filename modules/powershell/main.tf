resource null_resource module_null_resource {
  triggers = {
    "always_run" = "${timestamp()}"
  }

  provisioner "local-exec" {
    command     =   var.powershellscript
    interpreter = ["PowerShell", "-Command"]
  }
}
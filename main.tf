provider "hyperv" {
  # Configuración del proveedor Hyper-V
}

resource "hyperv_virtual_machine" "frontend_app" {
  name             = "frontend-app"
  cpu_count        = 2
  memory_mb        = 4096
  network_adapter  = "Default Switch"
  source_image     = "path/to/windows-image.iso"
  virtual_hard_disks {
    path = "path/to/virtual-hard-disk.vhdx"
  }

  provisioner "local-exec" {
    command = "scp -r $(Build.ArtifactStagingDirectory)/* user@your-machine:/path/to/deploy && ssh user@your-machine 'cd /path/to/deploy && npm install && npm run build'"
  }
}

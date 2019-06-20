data "terraform_remote_state" "example" {
  backend = "atlas"
  config = {
    name = "ORG_NAME/WORKSPACE_NAME"
  }
}

resource "null_resource" "hello" {
  provisioner "local-exec" {
    command = "echo Hello ${data.terraform_remote_state.example.outputs.name}"
  }
}


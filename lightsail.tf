resource "aws_lightsail_instance" "web_server" {
  name              = "example-instance"
  availability_zone = "us-east-1a" # Set your desired availability zone
  blueprint_id      = "amazon_linux_2" # Lightsail blueprint ID for Amazon Linux 2

  bundle_id = "micro_2_0" # Lightsail bundle ID for a micro instance

  user_data = <<-EOF
              #!/bin/bash
              sudo yum install httpd -y
              sudo systemctl start httpd
              sudo systemctl enable httpd
              echo "<h1>This Server is created using Terraform </h1>" | sudo tee /var/www/html/index.html
              EOF
}

output "public_ip" {
  value = aws_lightsail_instance.web_server.public_ip_address
}
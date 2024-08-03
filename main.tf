

resource "aws_lightsail_instance" "server1" {
  name              = "dev-server1"
  availability_zone = "us-east-1a"  # Change this to your preferred availability zone
  blueprint_id      = "ubuntu_18_04" # Change this to the desired blueprint (e.g., Ubuntu, Amazon Linux, etc.)
  bundle_id         = "nano_2_0"     # Change this to the desired instance size (e.g., nano_2_0, micro_2_0, etc.)

  # User data script to run on instance creation
  
  # User data script to install Apache
  user_data = <<-EOF
    #!/bin/bash
    apt-get update -y
    apt-get install -y apache2
    systemctl start apache2
    
    # Enable Apache to start on boot
    systemctl enable apache2
    
    # Create a simple HTML page
    echo "<html><body><h1>Welcome to Apache on Lightsail by pierre!</h1></body></html>" > /var/www/html/index.html
    EOF


  tags = {
    Name = "example-instance"
  }
}

#!/bin/bash
# Install and start the Apache Web Server
sudo dnf install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd

# Query Instance Metadata Service Version 2 (IMDSv2)
TOKEN=$(curl -s -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
INSTANCE_ID=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/instance-id)
AZ=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/placement/availability-zone)

# Write dynamic server identity page
echo "<h1>Hello from SRM Cloud Architecture Server</h1><p><b>Instance ID:</b> $INSTANCE_ID</p><p><b>Zone Location:</b> $AZ</p>" > /var/www/html/index.html

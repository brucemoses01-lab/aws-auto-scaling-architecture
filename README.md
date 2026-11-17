# High-Availability & Auto-Scaling Web Infrastructure on AWS

Automated, fault-tolerant multi-tier web application deployed on Amazon Web Services (`ap-south-1`).

## Architecture Overview
- **VPC:** `BMG-architect-VPC` (`10.0.0.0/16`)
- **Subnets & AZs:** Public subnets across `ap-south-1a` and `ap-south-1b`
- **Internet Gateway:** `BMG-IGW` (`0.0.0.0/0` routing)
- **Load Balancing:** Application Load Balancer (`bmg-external-vpc`) routing HTTP Port 80 to Target Group `App-Cluster-TG`
- **Auto Scaling:** `BMG-core-ASG` using Launch Template `Gold-Webserver-Template` and IMDSv2 User Data bootstrapping (`scripts/user-data.sh`)

## Repository Contents
- `scripts/user-data.sh` — EC2 cold-boot Apache setup & IMDSv2 metadata script
- `AWS-Auto-Scaling-Project-Report.pdf` — Full implementation and verification report

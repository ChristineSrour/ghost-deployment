# Infrastructure and CI/CD Setup using Terraform, AWS ECS, and AWS Developer Tools


This project sets up an AWS infrastructure to deploy a containerized GHOST application using Terraform for infrastructure as code (IaC), AWS Elastic Container Service (ECS) with Fargate for running containers without managing servers, and a continuous integration and continuous deployment (CI/CD) pipeline using AWS developer tools.

Infrastructure Overview
The infrastructure is defined in Terraform and includes the following components:

VPC (Virtual Private Cloud): Custom virtual network space in AWS.
Subnets: Network subdivisions designed for public and private access.
Internet Gateway (IGW): Provides access to the internet from AWS VPC.
NAT Gateway: Allows instances in private subnets to access the internet while remaining private.
Route Tables: Define rules to determine where network traffic is directed.
ECS Cluster: A cluster to manage ECS services and tasks.
ECS Task Definition and Service: Defines the application to run and maintains the desired count of instances of the application.
ECR (Elastic Container Registry): Docker container registry to store, manage, and deploy Docker container images.
CloudWatch Log Group: Used for logging the output and errors from the ECS tasks.
IAM Roles and Policies: Provides necessary permissions for ECS tasks and services.
Load Balancer (LB) with Listener and Target Group: Distributes incoming application traffic across multiple targets, such as EC2 instances, in multiple Availability Zones.
Security Groups: Acts as a virtual firewall for your instances to control inbound and outbound traffic.
CI/CD Overview
The CI/CD pipeline is built using AWS developer tools to automate the deployment process:

AWS CodeCommit: Stores the application code and the Terraform configuration.
AWS CodeBuild: Compiles the code, runs tests, and produces software packages that are ready to deploy.
AWS CodeDeploy: Automates application deployments to Amazon ECS.
AWS CodePipeline: Orchestrates the workflow of the CI/CD process, connecting CodeCommit, CodeBuild, and CodeDeploy.
Best Practices Incorporated
Infrastructure as Code (IaC): Using Terraform for predictable deployments.
Module Structure: Organizing infrastructure into modules for reusability and manageability.
Version Control: All infrastructure code and application code are version controlled in AWS CodeCommit.
Continuous Integration: Every change is automatically built, and tests are run using AWS CodeBuild.
Continuous Deployment: Automated deployment using AWS CodeDeploy, ensuring that the latest version is always running.
Rolling Updates: AWS ECS and CodeDeploy allow for rolling updates to minimize downtime.
Security: Least privilege access via IAM roles and security groups.
High Availability: Resources are spread across multiple Availability Zones.
Scalability: Use of AWS Fargate to allow easy scaling of containers.
Monitoring and Logging: Using AWS CloudWatch for logging and monitoring of the infrastructure and application.
Load Balancing: AWS Load Balancer ensures the distribution of traffic and fault tolerance.
Backup and Restore: State files are stored in an S3 bucket for recovery and historical purposes.

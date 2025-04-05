# Medusa Backend Deployment on AWS ECS Fargate with Terraform and GitHub Actions

This project deploys the [Medusa](https://medusajs.com/) headless commerce backend on AWS ECS using Fargate. Infrastructure is managed via Terraform, and GitHub Actions enables continuous deployment (CD).

---

## 🚀 Tech Stack

- **Infrastructure as Code**: Terraform
- **Cloud Provider**: AWS
- **Container Orchestration**: Amazon ECS with Fargate
- **Continuous Deployment**: GitHub Actions
- **Container Registry**: Amazon ECR
- **Networking**: ALB, VPC, Subnets, Security Groups
- **Application**: Medusa.js Backend

---

## 🧱 Project Structure

```bash
├── medusa-backend/       # Node.js backend (Medusa)
│   ├── Dockerfile
│   ├── index.js
│   └── package.json
├── terraform/            # IaC using Terraform
│   ├── main.tf
│   ├── alb.tf
│   ├── outputs.tf
│   ├── ecs.tf
│   ├── ecr.tf
│   ├── security_groups.tf
│   ├── iam.tf
├── .github/workflows/    # GitHub Actions pipeline
│   └── deploy.yml
└── README.md             # Project overview and instructions


**⚙️ How It Works**

1. Terraform provisions:

VPC, subnets, internet gateway, and route tables

Security groups

ECS cluster and service with ALB

IAM roles and ECR

2. Medusa backend container is built using Docker and pushed to ECR.

3. GitHub Actions triggers CD on every push to the main branch, updating the ECS service.

**🛠️ Setup Instructions**

**🔐 1. Configure GitHub Secrets**

Go to your GitHub repo > Settings > Secrets > Actions and add:

**Name**	                                                   **Description**

AWS_ACCESS_KEY_ID	                                       Your AWS access key
AWS_SECRET_ACCESS_KEY	                                   Your AWS secret access key

**🐳 2. Push Code and Trigger Deployment**

git add .

git commit -m "Deploy Medusa ECS project"

git push origin main

This will automatically trigger GitHub Actions and deploy your application to ECS Fargate.

**🌐 Access Your App**

After deployment, access Medusa backend using the ALB DNS output by Terraform:

terraform output alb_dns

Example Output:

http://medusa-alb-xxxxxxxxx.us-east-1.elb.amazonaws.com





# Task 6: Automated Strapi Deployment using GitHub Actions & Terraform

This project demonstrates end-to-end automation of deploying a Strapi application on AWS EC2 using GitHub Actions (CI/CD) and Terraform.

## Project Overview
- CI Pipeline builds and pushes a Strapi Docker image to DockerHub
- CD Pipeline provisions AWS infrastructure using Terraform
- EC2 instance automatically pulls and runs the Strapi container using user_data

---

## Architecture
```text
GitHub Push (main)
        │
        ▼
GitHub Actions (CI)
- Build Docker Image
- Push to DockerHub
        │
        ▼
GitHub Actions (CD)
- Terraform Apply
        │
        ▼
AWS EC2 (t2.micro)
- Install Docker
- Pull Strapi Image
- Run Strapi Container
```

---

## Technologies Used
- Strapi
- Docker
- GitHub Actions
- Terraform
- AWS EC2
- DockerHub

---

## Repository Structure
```text
.
├── .github/workflows
│   ├── ci.yml
│   └── terraform.yml
├── terraform
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
├── Dockerfile
├── package.json
├── README.md
```

---

## CI Pipeline (Docker Build & Push)

Triggered on: Push to main branch
### CI Responsibilities:
- Build Strapi Docker image
- Push image to DockerHub

### Resulting image example:
```bash
<dockerhub-username>/strapi:latest
```

---

## CD Pipeline (Terraform Deployment)
Triggered manually: workflow_dispatch

### CD Responsibilities:
- Initialize Terraform
- Provision AWS EC2 instance
- Pass environment variables securely using GitHub Secrets
- Deploy Strapi automatically using EC2 user_data

---

## GitHub Secrets Used
The following secrets are configured in GitHub Actions:

### AWS
- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY
- AWS_REGION
- EC2_KEY_NAME

### Application
- ADMIN_JWT_SECRET
- API_TOKEN_SALT
- APP_KEYS
- JWT_SECRET
- DOCKERHUB_USERNAME

All secrets are injected securely during runtime.

---

## EC2 Bootstrapping (user_data)

### On instance launch, the following happens automatically:
- System update
- Docker installation
- Docker service start
- Pull Strapi image from DockerHub
- Run Strapi container on port 1337
- No manual intervention is required.

---

## Accessing Strapi

After successful deployment, Strapi can be accessed via:
```bash
http://<EC2_PUBLIC_IP>:1337/admin
```

---

## Outcome
- CI pipeline successfully builds and pushes Docker image
- CD pipeline successfully provisions AWS infrastructure
- Terraform deployment completes successfully
- EC2 instance is created and configured automatically

---

## Author
Jaspal Gundla
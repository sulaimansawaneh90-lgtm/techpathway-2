# Tech Challenge 2 – Full-Stack Deployment with Jenkins, Docker & AWS

## Overview

This project deploys a React frontend and Express backend application to an AWS EC2 server using Docker and Jenkins.

Terraform manages the AWS infrastructure, while Jenkins provides the CI/CD pipeline that builds, tests, and deploys the application.

## Architecture

Developer
    |
    v
GitHub Repository
    |
    v
Jenkins CI/CD
    |
    +-------------------+
    |                   |
    v                   v
Terraform             Docker
    |                   |
    v                   v
AWS EC2          Docker Containers
                       |
              +--------+--------+
              |                 |
              v                 v
        React Frontend    Express Backend
          Port 3000          Port 5000

## Technologies

- AWS EC2
- Terraform
- Amazon S3
- Jenkins
- Docker
- GitHub
- Node.js
- React
- Express

## AWS Infrastructure

| Resource | Details |
|---|---|
| EC2 Instance | i-0a90a4c2f7102f835 |
| Instance Type | t3.micro |
| Region | us-east-1 |
| Jenkins Port | 8080 |
| Frontend Port | 3000 |
| Backend Port | 5000 |
| Terraform State | Amazon S3 |
| State Bucket | techpathway-terraform-state-285851439149 |

Terraform state is stored remotely in Amazon S3 with versioning and server-side encryption enabled.

## Project Structure

.
├── backend/
├── frontend/
├── terraform/
├── Jenkinsfile
└── README.md

## Terraform Deployment

Initialize Terraform:

    terraform -chdir=terraform init

Validate the configuration:

    terraform -chdir=terraform validate

Review the infrastructure plan:

    terraform -chdir=terraform plan

The expected result is:

    No changes. Your infrastructure matches the configuration.

## Jenkins CI/CD Pipeline

The Jenkins pipeline is defined in Jenkinsfile.

Pipeline stages:

1. Checkout source code
2. Terraform initialization
3. Terraform validation
4. Terraform plan
5. Build backend Docker image
6. Build frontend Docker image
7. Test frontend production build
8. Verify Docker images
9. Deploy application containers

Jenkins:

http://18.210.6.207:8080

## Docker Deployment

Build the backend:

    docker build -t techpathway-backend ./backend

Build the frontend:

    docker build -t techpathway-frontend ./frontend

Run the backend:

    docker run -d --name techpathway-backend -p 5000:5000 techpathway-backend

Run the frontend:

    docker run -d --name techpathway-frontend -p 3000:3000 techpathway-frontend

Check containers:

    docker ps

## Application URLs

Frontend:

http://18.210.6.207:3000

Backend:

http://18.210.6.207:5000

Jenkins:

http://18.210.6.207:8080

## Verification

Backend:

    curl http://localhost:5000

Frontend:

    curl -I http://localhost:3000

Docker:

    docker ps

Jenkins:

    sudo systemctl status jenkins

Terraform:

    terraform -chdir=terraform plan

## CI/CD Result

A successful Jenkins pipeline finishes with:

    CI/CD pipeline completed successfully!
    Finished: SUCCESS

## Additional Features

This project implements:

- Dockerized frontend and backend
- Jenkins CI/CD
- Terraform infrastructure as code
- Remote Terraform state using Amazon S3
- S3 state versioning
- S3 server-side encryption
- Automated Terraform validation and planning
- Automated Docker image builds
- Automated application deployment

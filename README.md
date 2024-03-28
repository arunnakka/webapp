
# Web Application Deployment Workflow

This repository contains the code for a web application, along with a CI/CD workflow for building, publishing, and deploying the application using Google Cloud Platform (GCP). Below is an overview of the project structure and the CI/CD workflow implemented.

## Project Structure


    webapp/
    ├── .github/
    │   └── workflows/
    │       └── google.yml        # CI/CD workflow definition file
    ├── requirements.txt          # Python dependencies required for the application
    ├── Dockerfile                # Docker configuration for building the application image
    └── simple_webapp.py          # Source code for the web application 

## Workflow Overview

The CI/CD workflow defined in `.github/workflows/google.yml` automates the build, publish, and deployment process of the web application. Here's a breakdown of the workflow steps:

1.  **Authentication**: The workflow begins by authenticating with Google Cloud Platform using service account credentials stored securely in GitHub Secrets.
    
2.  **Environment Variable Setup**: Sets the environment variable `ENVIRONMENT` based on the branch being pushed (`main` for production and `stage` for staging).
    
3.  **Checkout**: Checks out the latest version of the codebase.
    
4.  **Docker Configuration**: Configures Docker to authenticate with Google Artifact Registry (GAR) to push the Docker image.
    
5.  **Build Docker Image**: Builds the Docker image for the web application using the provided Dockerfile.
    
6.  **Publish Docker Image**: Pushes the built Docker image to Google Artifact Registry for storage and distribution.
    
7.  **Trigger Terraform Workflow**: Initiates a separate Terraform workflow for infrastructure provisioning and management. The child workflow is triggered based on the changes made to the application, ensuring that infrastructure is updated accordingly.
    

## Additional Notes

-   This workflow follows CI/CD and DevOps best practices by automating the deployment process, ensuring consistency, reliability, and repeatability of deployments.
-   Secrets such as GCP service account credentials and GitHub tokens are securely stored in GitHub Secrets and accessed only during the workflow execution.
-   The workflow is triggered automatically on pushes to the `main` and `stage` branches, allowing for continuous integration and deployment.
-   By separating infrastructure provisioning using Terraform, infrastructure changes can be managed independently from application changes, promoting scalability and maintainability.

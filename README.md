# Lab 3 — hello-app on Kubernetes with Terraform

Name: KARTHIK K

Roll number:261100680013

## Part 1: first `terraform plan`

Paste the `Plan:` line and the summary above it.

```

```

## Part 1: `terraform output -raw url`

```

```

## Part 2: plan for the v1 → v2 image change

Paste the lines that show the image change, and the `Plan:` line.

```

```

## Part 3: plan that found the drift after `kubectl scale`

```

```

## Part 4: `kubectl get svc -A` showing dev and prod

```

```

## Break it: the error after deleting `terraform.tfstate`

```

```

## Break it: the wrong selector

What did you see, and how did you find the cause? One or two sentences.



## Screenshot

Save a browser screenshot as `screenshot.png` in the repository root.

## Lab 3 - Final Completion

### Activities Completed

1. Terraform installation and configuration.
2. Kubernetes application deployment.
3. Application image version update.
4. Terraform infrastructure drift detection.
5. Reusable Terraform modules.
6. DEV and PROD environment deployment.
7. Terraform state backup and recovery.
8. Kubernetes Service selector troubleshooting.

### Technologies Used

- Ubuntu
- Terraform
- Docker
- Kubernetes
- Kind
- Git
- GitHub Actions

### Verification

DEV environment: 3 Pods running.

PROD environment: 3 Pods running.

Application tested using Kubernetes port forwarding.


Lab 3: Infrastructure as Code with Terraform and Kubernetes
Overview

This project demonstrates Infrastructure as Code (IaC) using Terraform to deploy and manage applications on a Kubernetes cluster.

The lab covers Terraform configuration, Kubernetes deployments, infrastructure drift detection, reusable modules, environment separation, and Terraform state management.

Technologies Used
Ubuntu Linux
Terraform
Docker
Kubernetes
Kind (Kubernetes in Docker)
Git and GitHub
GitHub Actions
Nginx
Project Architecture

The project uses Terraform to provision and manage Kubernetes resources.

Three application replicas are deployed in separate namespaces for development and production environments.

text
ms-cloud-devops-lab3/
│
├── .github/
│   └── workflows/
│
├── modules/
│   └── hello-app/
│       └── main.tf
│
├── envs/
│   ├── dev/
│   │   └── main.tf
│   │
│   └── prod/
│       └── main.tf
│
├── main.tf
├── README.md
└── screenshot.png

Lab Activities
1. Terraform Setup

Installed and configured Terraform on Ubuntu.

Verified the installation:

bash
terraform version

2. Kubernetes Deployment

Configured Terraform to deploy the hello-app application to Kubernetes.

Verified the deployment:

bash
kubectl get pods -n lab3
kubectl get services -n lab3


Three application replicas were deployed successfully.

3. Application Image Update

Updated the application image version from v1 to v2 through Terraform configuration.

Used Terraform plan and apply to manage the change.

4. Infrastructure Drift Detection

Manually changed the Kubernetes deployment replica count.

Used:

bash
kubectl scale deployment hello-app -n lab3 --replicas=5
terraform plan


Terraform detected the difference between the configuration and actual infrastructure.

Applied the configuration to restore the desired replica count.

5. Reusable Terraform Modules

Created a reusable Terraform module under:

text
modules/hello-app/


The module manages:

Kubernetes Namespace
Kubernetes Deployment
Kubernetes Service
6. DEV and PROD Environments

Created separate Terraform configurations:

text
envs/dev/
envs/prod/


Both environments were deployed successfully.

DEV verification:

bash
kubectl get pods -n dev
kubectl get services -n dev


PROD verification:

bash
kubectl get pods -n prod
kubectl get services -n prod


Both environments successfully ran three application replicas.

7. Terraform State Management

Explored Terraform state management.

Activities included:

Inspecting Terraform state.
Listing managed resources.
Creating a state backup.
Simulating state-file loss.
Restoring the original state backup.

Terraform state is important because it tracks the infrastructure managed by Terraform.

8. Kubernetes Service Selector Troubleshooting

Explored how an incorrect Kubernetes Service selector affects application connectivity.

The selector was intentionally modified to create a mismatch between the Service and Pod labels.

The selector was subsequently corrected and the application endpoints were verified.

Application Access

The application was accessed using Kubernetes port forwarding.

DEV:

bash
kubectl port-forward -n dev service/hello-app 8083:8080


Access:

http://localhost:8083

PROD:

bash
kubectl port-forward -n prod service/hello-app 8084:8090


Access:

http://localhost:8084

GitHub Actions

GitHub Actions was configured to automate the project workflow.

The Actions tab was used to monitor workflow executions triggered by repository changes.

Screenshots

The project screenshot is provided as:

screenshot.png

It demonstrates the deployed application environments.

Learning Outcomes

Through this lab, I gained practical experience with:

Infrastructure as Code using Terraform.
Kubernetes resource management.
Terraform infrastructure drift detection.
Reusable Terraform modules.
DEV and PROD environment separation.
Terraform state backup and recovery.
Kubernetes Service troubleshooting.
Git version control and GitHub Actions.
Conclusion

This lab provided hands-on experience in automating Kubernetes infrastructure using Terraform.

It demonstrated how Infrastructure as Code improves consistency, reusability, infrastructure management, and deployment workflows.

# Lab 3 — hello-app on Kubernetes with Terraform

Name: KARTHIK K

Roll number:261100680013

## Part 1: first `terraform plan`

Installed and configured Terraform on Ubuntu.

Verified the installation:

terraform version

## Part 1: `terraform output -raw url`

The application was deployed successfully on the Kubernetes cluster using Terraform.

The application URL was accessed using Kubernetes port forwarding.

http://localhost:8082

## Part 2: plan for the v1 → v2 image change

The Terraform plan detected the application image version change from v1 to v2.
text

# Example output — replace with your actual image names

~ image = "hello-app:v1" -> "hello-app:v2"

Plan: 0 to add, 1 to change, 0 to destroy.

## Part 3: plan that found the drift after `kubectl scale`

Terraform detected infrastructure drift after manually changing the number of Kubernetes replicas using kubectl scale.

# Example output — replace with your actual Terraform output

~ replicas = 5 -> 3

Plan: 0 to add, 1 to change, 0 to destroy.

## Part 4: `kubectl get svc -A` showing dev and prod

DEV and PROD environments were successfully created using reusable Terraform modules.

Both environments were configured with Kubernetes Services.
text

# Illustrative output — use your actual kubectl output

NAMESPACE   NAME        TYPE        PORT(S)
dev          hello-app   ClusterIP   8080/TCP
prod         hello-app   ClusterIP   8090/TCP


## Break it: the error after deleting `terraform.tfstate`

Terraform state management was explored by creating a backup of the state file and simulating state-file loss.

The backup was restored successfully.

The experiment demonstrated the importance of Terraform state in tracking managed infrastructure.

## Break it: the wrong selector

The Kubernetes Service selector was intentionally changed to an incorrect label. This caused the Service to lose its matching Pod endpoints.

The problem was identified by checking the Service endpoints and comparing the Service selector with the Pod labels. Restoring the correct selector resolved the issue.

## Screenshot

The browser screenshots demonstrate the deployed hello-app application.

    screenshot1.png
    screenshot2.png
    screenshot3.png

## Conclusion

This lab provided practical experience with Infrastructure as Code using Terraform, Kubernetes application deployment, infrastructure drift detection, reusable modules, DEV and PROD environments, state management and Kubernetes troubleshooting.


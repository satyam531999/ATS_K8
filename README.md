# Web Application Deployment on Kubernetes with Prometheus Monitoring

This guide explains how to deploy a simple static web application on AWS using Kubernetes (EKS) and monitor it with Prometheus. We’ll use Terraform for infrastructure provisioning and Helm for Prometheus deployment.

---

## Prerequisites

Ensure the following tools are installed:

- **Docker**: To build and run the web app container.
- **Terraform**: To provision AWS infrastructure.
- **kubectl**: To manage the Kubernetes cluster.
- **Helm**: To deploy Prometheus.
- **AWS CLI**: To configure AWS credentials.

Run `aws configure` to set up AWS CLI.

---

## Repository Structure

```
.
├── README.md               # This documentation
├── Dockerfile              # Containerizes the web app
├── index.html              # Static page for the app
├── kubernetes              # Kubernetes manifests (deployment, service, ingress, prometheus)
│   └── prometheus.yaml     # Prometheus setup
└── terraform               # Terraform files for AWS infrastructure
    ├── main.tf             # AWS resources provisioning
    ├── variables.tf        # Input variables for customization
    └── outputs.tf          # Outputs after Terraform execution
```

---

## Steps to Deploy

### Step 1: Build the Docker Image

```bash
docker build -t web-app .
docker run -d -p 8080:80 web-app
```

Visit `http://localhost:8080` to verify the app works.

---

### Step 2: Provision AWS Infrastructure with Terraform

1. **Navigate to the `terraform` directory**:

   ```bash
   cd terraform
   ```

2. **Initialize Terraform**:

   ```bash
   terraform init
   terraform apply
   ```

3. Confirm resources creation and allow Terraform to provision the infrastructure.

---

### Step 3: Set Up kubectl for EKS

Update your kubeconfig with:

```bash
aws eks --region <region> update-kubeconfig --name <cluster-name>
kubectl get nodes
```

---

### Step 4: Deploy the Web App and Prometheus

1. **Deploy app and Prometheus**:

   ```bash
   kubectl apply -f kubernetes/deployment.yaml
   kubectl apply -f kubernetes/service.yaml
   kubectl apply -f kubernetes/ingress.yaml
   kubectl apply -f kubernetes/prometheus.yaml
   ```

---

### Step 5: Verify the Deployment

1. **Check running pods**:

   ```bash
   kubectl get pods
   ```

2. **Access the web app** via the LoadBalancer IP from `kubectl get services`.

3. **Access Prometheus** by port-forwarding:

   ```bash
   kubectl port-forward svc/prometheus 9090:9090 -n monitoring
   ```

   Visit `http://localhost:9090` to access Prometheus.

---

### Step 6: Clean Up

To remove all resources created by Terraform:

```bash
terraform destroy
```

---

## Variables and Outputs

### Input Variables (`variables.tf`)

- **`region`**: AWS region.
- **`vpc_cidr_block`**: VPC CIDR block.
- **`eks_cluster_name`**: EKS cluster name.
- **`worker_nodes_count`**: Number of worker nodes.

### Output Values (`outputs.tf`)

- **`eks_cluster_name`**: EKS cluster name.
- **`eks_cluster_endpoint`**: Endpoint for the EKS cluster.
- **`load_balancer_url`**: URL to access the web app.

---

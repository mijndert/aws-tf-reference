# Kubernetes Hello World Deployment

This directory contains a complete Kubernetes deployment example that demonstrates how to deploy a simple application on EKS with AWS Application Load Balancer (ALB) ingress.

## What is hello-world-deployment.yml?

The `hello-world-deployment.yml` file contains a complete Kubernetes manifest that deploys a sample application with the following components:

### 1. IngressClassParams
```yaml
apiVersion: eks.amazonaws.com/v1
kind: IngressClassParams
```
- Defines parameters for the AWS Load Balancer Controller
- Configures the ALB scheme as `internet-facing` (publicly accessible)

### 2. IngressClass
```yaml
apiVersion: networking.k8s.io/v1
kind: IngressClass
```
- Sets up the ALB ingress class as the default ingress controller
- Uses the AWS Load Balancer Controller (`eks.amazonaws.com/alb`)

### 3. Deployment
```yaml
apiVersion: apps/v1
kind: Deployment
```
- Deploys 2 replicas of a simple "Hello World" application
- Uses the Google sample app image: `gcr.io/google-samples/hello-app:1.0`
- Application runs on port 8080 inside the container

### 4. Service
```yaml
apiVersion: v1
kind: Service
```
- Creates a ClusterIP service to expose the deployment internally
- Maps external port 80 to container port 8080
- Selects pods with the label `app: hello-world`

### 5. Ingress
```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
```
- Creates an AWS Application Load Balancer (ALB)
- Routes HTTP traffic on port 80 to the hello-world service
- Configured as internet-facing and targets IP addresses directly
```
## Deploying the Hello World Application

### 1. Apply the Manifest

```bash
kubectl apply -f hello-world-deployment.yml
```

### 2. Verify the Deployment

Check that all resources are created successfully:

```bash
# Check the deployment
kubectl get deployment hello-world-deployment

# Check the service
kubectl get service hello-world-service

# Check the ingress
kubectl get ingress hello-world-ingress

# Check the pods
kubectl get pods -l app=hello-world
```

### 3. Wait for ALB Provisioning

The AWS Load Balancer Controller will create an Application Load Balancer. This process takes a few minutes:

```bash
# Watch the ingress status
kubectl get ingress hello-world-ingress -w
```

## Finding the ALB Address

```bash
kubectl describe ingress hello-world-ingress
```

Look for the `Address` field in the output:
```
Address: k8s-default-hellowor-xxxxxxxxxx-yyyyyyyyyy.eu-central-1.elb.amazonaws.com
```
```

## Testing the Application

Once the ALB is provisioned and you have the address, open your browser and navigate to:
```
http://your-alb-address.eu-central-1.elb.amazonaws.com
```

## Cleanup

To remove the hello world application:

```bash
kubectl delete -f hello-world-deployment.yml
```

This will:
- Delete the deployment and pods
- Remove the service
- Delete the ingress (which will also delete the ALB)
- Clean up the ingress class configuration

## Next Steps

For production deployments, consider:
- Adding HTTPS/TLS termination
- Implementing proper health checks
- Setting up horizontal pod autoscaling
- Implementing proper logging and monitoring
- Adding security contexts and network policies

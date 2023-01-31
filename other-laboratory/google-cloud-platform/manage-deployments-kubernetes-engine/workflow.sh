:'
Dev Ops practices will regularly make use of multiple deployments to manage application deployment scenarios 
such as "Continuous deployment", "Blue-Green deployments", "Canary deployments" and more. 
This is to provide practice in scaling and managing containers so you can accomplish these common scenarios where multiple heterogeneous 
deployments are being used.
'
#
#
#
#

:'
Heterogeneous deployments typically involve connecting two or more distinct infrastructure environments or regions to address 
a specific technical or operational need. Heterogeneous deployments are called "hybrid", "multi-cloud", or "public-private", 
depending upon the specifics of the deployment.

For the purposes of this lab, heterogeneous deployments include those that span regions within a single cloud environment, 
multiple public cloud environments (multi-cloud), or a combination of on-premises and public cloud environments (hybrid or public-private).
'
#
#
#
# 
#
:'
Various business and technical challenges can arise in deployments that are limited to a single environment or region:

-- Maxed out resources: In any single environment, particularly in on-premises environments, you might not have the compute, networking, and storage resources to meet your production needs.
-- Limited geographic reach: Deployments in a single environment require people who are geographically distant from one another to access one deployment. Their traffic might travel around the world to a central location.
-- Limited availability: Web-scale traffic patterns challenge applications to remain fault-tolerant and resilient.
-- Vendor lock-in: Vendor-level platform and infrastructure abstractions can prevent you from porting applications.
-- Inflexible resources: Your resources might be limited to a particular set of compute, storage, or networking offerings.
-- Heterogeneous deployments can help address these challenges, but they must be architected using programmatic and deterministic processes and procedures. One-off or ad-hoc deployment procedures can cause deployments or processes to be brittle and intolerant of failures. Ad-hoc processes can lose data or drop traffic. Good deployment processes must be repeatable and use proven approaches for managing provisioning, configuration, and maintenance.

Three common scenarios for heterogeneous deployment are multi-cloud deployments, fronting on-premises data, and 
continuous integration/continuous delivery (CI/CD) processes.

The following exercises practice some common use cases for heterogeneous deployments, along with well-architected approaches using 
Kubernetes and other infrastructure resources to accomplish them.
'
#
#
#
#
# Once shell is activated. List active account name with
gcloud auth list

# Authorize

# List project ID with...
gcloud config list project


# Set the Zone
gcloud config set compute/zone

# Obtain sample code for creating and running containers and deployments
gsutil -m cp -r gs://spls/gsp053/orchestrate-with-kubernetes .
cd orchestrate-with-kubernetes/kubernetes

# Create a cluster with 3 nodes
gcloud container clusters create bootcamp \
  --machine-type e2-small \
  --num-nodes 3 \
  --scopes "https://www.googleapis.com/auth/projecthosting,storage-rw"
  
#
#
# Learn about the deployment object
# First let's take a look at the deployment object
#
#
# The "explain" command with kubectl tells us about the deployment object
#
kubectl explain deployment

# We can also see all of the fields using the --recursive option
kubectl explain deployment --recursive

# As an example, you can also work with the explain command to understand what individual fields do 
kubectl explain deployment.metadata.name

#
#
# Create a deployment
#
#
# Update the "deployments/auth.yaml" configurations file
#
vi deployments/auth.yaml

# modify with the following values the "auth" configurations file -- then save the file
...
containers:
- name: auth
  image: "kelseyhightower/auth:1.0.0"
...

# Inspect the file to see if updates were made and saved
cat deployments/auth.yaml

:'
Notice how the deployment is creating one replica and it's using version 1.0.0 of the auth container.

When you run the kubectl create command to create the auth deployment, it will make one pod that conforms to the data in the deployment manifest. 
This means we can scale the number of Pods by changing the number specified in the replicas field.
'

#
#
#
#
#








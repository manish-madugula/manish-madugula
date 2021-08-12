# Useful Concepts

## Devcloud
### TORQUE -> Distributed Job Queue
### VINO -> Computer Vision SDK
### Edge -> Compute where the datasource is there??

## ELK vs EFK Stack (Logstash vs FluentD)

## ansible playbook advantage of openshift
- Provisioning
-Config Management
	- OS Patches
	- Installing Service on a Machine
- App Deployment
- Declarative using yaml
- Idempotent
- No need to install agent/daemon on the host vms.
- Autoscaling

## Rsync vs SCP
- rsync will check files sizes and modification timestamps of both A and B, and skip any further processing if they match.
- If the destination file B already exists, the delta transfer algorithm will make sure only differences between A and B are sent over the wire.
- rsync will write data to a temporary file T, and then replace the destination file B with T to make the update look "atomic" to processes that might be using B.
- Also, when dealing with large files, use rsync with the -P option. If the transfer is interrupted, you can resume it where it stopped by reissuing the command.
- use scp for your day to day tasks. 
- For recurring tasks, like cron jobs, use rsync. On multiple invocations it will take advantage of data already transferred, performing very quickly and saving on resources.
	
## Cloud Native

## Hybrid Cloud;	

# Openshift 

## Kubernets Components
- https://kubernetes.io/docs/concepts/overview/components/

## Pods (Containers for your containers)
A pod is a logical wrapper entity for a container to execute on a K8s(Kubernetes) cluster. Pods are the smallest deployable units in Kubernetes. Pod is a group of one or more containers, with shared storage/network resources, and a specification for how to run the containers. . Each pod is allocated its own internal IP address, therefore owning its entire port space, and containers within pods can share their local storage and networking.

OpenShift Enterprise treats pods as largely immutable; changes cannot be made to a pod definition while it is running. OpenShift Enterprise implements changes by terminating an existing pod and recreating it with modified configuration, base image(s), or both. Pods are also treated as expendable, and do not maintain state when recreated. Therefore manage pods with higher-level controllers, rather than directly by users. The container can bind to ports which will be made available on the pod’s IP.

## Service
- A Kubernetes service serves as an internal load balancer. It identifies a set of replicated pods in order to proxy the connections it receives to them. Backing pods can be added to or removed from a service arbitrarily while the service remains consistently available, enabling anything that depends on the service to refer to it at a consistent internal address.

## Cluster
- If you’re running Kubernetes, you’re running at least one cluster.
- This cluster is sort of like a central nervous system for your application(s).
- A cluster is a board that provides the circuitry to run all the pods (which have the container instances in them) in an orchestrated manner as defined by the users
- A group of pods, related or unrelated, run on a cluster. A pod is a unit of replication on a cluster
- A cluster can contain many pods, related or unrelated [and] grouped under the tight logical borders called namespaces.

## Nodes
- In Kubernetes, nodes are essentially the machines, whether physical or virtual, that host the pods.
- Every Kubernetes cluster includes a master node and at least one worker node. (A cluster will often include multiple worker nodes.
- The master node is essentially the brains of the operation: It controls your desired state, and everything feeds off of it. Worker nodes are physical or virtual machines that run your actual applications and workloads.
- the worker nodes are scalable and disposable.

### Master Node (Control Plane)
- The control plane's components make global decisions about the cluster (for example, scheduling), as well as detecting and responding to cluster events.
- There are three key components of the master node: the Kubernetes API server, scheduler, and controller manager.
- The complete Kubernetes control plane also includes etcd and kubectl. Etcd is a distributed key value storage and kubectl is the command line interface.
- The control plane manages the worker nodes and the Pods in the cluster. In production environments, the control plane usually runs across multiple computers and a cluster usually runs multiple nodes, providing fault-tolerance and high availability.

#### Scheduler (kube-scheduler)
- Control plane component that watches for newly created Pods with no assigned node, and selects a node for them to run on.

#### kube-apiserver 
- The API server is a component of the Kubernetes control plane that exposes the Kubernetes API. The API server is the front end for the Kubernetes control plane.

#### kube-controller-manager
- Node controller: Responsible for noticing and responding when nodes go down.
- Job controller: Watches for Job objects that represent one-off tasks, then creates Pods to run those tasks to completion.
- Service Account & Token controllers: Create default accounts and API access tokens for new namespaces.


### Worker Node
- Worker nodes, meanwhile, include kubelet, kube-proxy, and your container runtime.

#### kubelet
- An agent that runs on each node in the cluster. It makes sure that containers are running in a Pod.
- The kubelet doesn't manage containers which were not created by Kubernetes

#### kubeproxy
- kube-proxy is a network proxy that runs on each node in your cluster, implementing part of the Kubernetes Service concept.

#### Container runtime
- The container runtime is the software that is responsible for running containers. Like Docker.

## Namespaces
- Kubernetes supports multiple virtual clusters backed by the same physical cluster. These virtual clusters are called namespaces.
- Namespaces are intended for use in environments with many users spread across multiple teams, or projects. 
-  Names of resources need to be unique within a namespace, but not across namespaces. 
- Namespaces cannot be nested inside one another and each Kubernetes resource can only be in one namespace.
- Namespaces are a way to divide cluster resources between multiple users 

## Labels
- Labels are key/value pairs that are attached to objects, such as pods. Labels are intended to be used to specify identifying attributes of objects that are meaningful and relevant to users, but do not directly imply semantics to the core system. Labels can be used to organize and to select subsets of objects. 

## Multitenant architecture or separate cluster for each application.
- First is complex and is achieved using namespaces.
- Second is simpler.

## Context

## Odo Tool
### Odo Watch

## Component

## Application

## Project
A project is a Kubernetes namespace with additional annotations, and is the central vehicle by which access to resources for regular users is managed. Each project scopes its own set of:
	- Objects : Pods, services, replication controllers, etc.
	- Policies : Rules for which users can or cannot perform actions on objects.
	- Constraints : Quotas for each kind of object that can be limited.
	- Service accounts : Service accounts act automatically with designated access to objects in the project.

## User
- Interaction with OpenShift is associated with a user. An OpenShift user object represents an actor which may be granted permissions in the system by adding roles to them or to their groups.
- Regular User : This is the way most interactive OpenShift users will be represented. Regular users are created automatically in the system upon first login, or can be created via the API.
- System User : Many of these are created automatically when the infrastructure is defined, mainly for the purpose of enabling the infrastructure to interact with the API securely. 
- Service Accounts : These are special system users associated with projects; some are created automatically when the project is first created, while project administrators can create more for the purpose of defining access to the contents of each project. Service accounts are represented with the ServiceAccount object. Examples: system:serviceaccount:default:deployer system:serviceaccount:foo:builder
	
## Role Bindings
	
## Route
A route is only usually used for web applications which use the HTTP protocol. A route cannot be used to expose a database as they would typically use their own distinct protocol and routes would not be able to work with the database protocol.
	
## Build Config Object
- A BuildConfig object is the definition of the entire build process.

### Docker builds
The Docker build strategy invokes the plain docker build command, and it therefore expects a repository with a Dockerfile and all required artifacts in it to produce a runnable image.

### S2I builds
Source-to-Image (S2I) is a tool for building reproducible Docker images. It produces ready-to-run images by injecting application source into a Docker image and assembling a new Docker image. 

## Image Stream
- An image stream can be used to automatically perform an action, such as updating a deployment, when a new image, such as a new version of the base image that is used in that deployment, is created.
- An image stream comprises one or more Docker images identified by tags. It presents a single virtual view of related images, similar to a Docker image repository
- OpenShift components such as builds and deployments can watch an image stream to receive notifications when new images are added and react by performing a build or a deployment.

## Containers in Openshift
- Containers don't run as root.
- Follow best pracitces like : defining the port any service is exposed on, not needing to run specifically as the root user or other dedicated user, and which embeds a default command for running the application.

	

	
## Openshift Commands

oc login --username user1 --password pass

oc get projects

oc get all (all resources)

oc get all -o name --selector app=parksmap

oc describe routes/parksmap (Detailed)

oc explain route.spec.host (What it means/ manual of some sort)

oc expose svc/parksmap (Exposes to the public internet)

oc create

oc edit

oc replace ( the metadata.name value of the JSON or YAML definition must be the same as that to be changed.)

oc patch (will patch only the required changes).
	
oc apply (even if resource doesn't exist this will work.)

oc delete (Deletes the resource)

oc new-app

oc rollout status dc/database (To monitor progress as the database is deployed and made ready)

oc rsh (To create an interactive shell within the same container running the database)

oc rsync (Copy the files to container)

oc port-forward <pod-name> <local-port>:<remote-port>

username : kubeadmin, password : hEEsV-yULNf-L53nz-CFApA, console : https://console-openshift-console.apps.devcloud.awsdevcloud.com

## Misc
- The default OpenShift router (HAProxy)

# Take access
- Gitlab
- Jira
- Teams Channel (Devcloud For the Edge) (Prabha)
	- DevCloud Gen 2 (Avinash)

devcloud-qa
devcloud-r2-dev
remove the 4th script
come up with a process to deal with the problem

# Setup BYOC

##  Install IntelliJ
##  Install Postgresql
##  Install Postman
- Or you can just use swagger api. (http://localhost:8080/swagger-ui/) after the byoc runs.
## Install DBeaver
## Install Java SDK 11
## Install OC tools
- https://github.com/openshift/origin/releases
## Use OC Console
### AWS Cluster
- Disable VPN
- URl: ```https://console-openshift-console.apps.devcloud.awsdevcloud.com```
- username is ```kubeadmin```
- password - Ask someone
### On Prem Cluster
- Connect to VPN

- Console URL: ```https://console-openshift-console.apps.cfa.devcloud.intel.com```
- Server URL: ```https://api.cfa.devcloud.intel.com:6443```
 
username: manish
password: Manish@Intel!ndia

## Connect OC using terminal

### OnPrem Cluster
- before this set proxy on terminal (Don't use powershell)
	- ```​set https_proxy=http://proxy-iind.intel.com:912``` 

- Login to console and get the login command. Should look like:
	- ```oc login --token= --server=https://api.cfa.devcloud.intel.com:6443```


## Establish local port forward connection
- Turn off the VPN if on AWS

- ```oc login --token= --server=https://api.devcloud.awsdevcloud.com:6443```

- ```oc project postgresql-qa```

- ```oc get pods```

- ```oc port-forward postgresql-3-nc75j 15432:5432```

## Reload Maven Project to download all dependencies
- Turn off the VPN

## Replace the application.properties with application-dev.properties

## Run the ByocApplication.java Main.
- Embedded Tomcat will run and also hikari connection pool will start on it's own thanks to local port forwarding


## Resources
- Kubernetes Architecture : https://kubernetes.io/docs/concepts/overview/components/
- https://learn.openshift.com/developing-on-openshift/
- https://learn.openshift.com/developing-with-spring/
- fabric8 APIs
- BYOS and BYOC code.
- Needs access to the Devcloud Gen 2 private channel for this resource : https://teams.microsoft.com/_#/files/DevCloud%20Gen2?threadId=19%3A780216da6e924bda8b0e4d30335c0f86%40thread.skype&ctx=channel&context=Intel%2520Confidential%2520-%2520Internal%2520use%2520only&rootfolder=%252Fsites%252FIoTDevCloud-DevCloudGen2%252FShared%2520Documents%252FDevCloud%2520Gen2%252FIntel%2520Confidential%2520-%2520Internal%2520use%2520onlyc



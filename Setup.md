# Take access
- Gitlab
- Jira

# Setup BYOC

##  Install IntelliJ
##  Install Postgresql
##  Install Postman
- Or you can just use swagger api. (http://localhost:8080/swagger-ui/) after the byoc runs.
## Install DBeaver
## Install Java SDK 11
## Install OC tools
## Use OC Console
### AWS Cluster
- Disable VPN
- URl: ```https://console-openshift-console.apps.devcloud.awsdevcloud.com```
- username is ```kubeadmin```
- password - ```hEEsV-yULNf-L53nz-CFApA```
### On Prem Cluster
- Connect to VPN

- Console URL: ```https://console-openshift-console.apps.cfa.devcloud.intel.com```
- Server URL: ```https://api.cfa.devcloud.intel.com:6443```
 
username: ```manish```
password: ```Manish@Intel!ndia```

## Connect OC using terminal

### OnPrem Cluster
- before this set proxy on terminal (Don't use powershell)
  	- ```​set https_proxy=http://proxy-iind.intel.com:912``` 

- Login to console and get the login command. Should look like:
	- ```oc login --token=sha256~j3crPM93rliaWOC9jhlStHehJFxca5UH_ZQ_fFRb_Zw --server=https://api.cfa.devcloud.intel.com:6443```


## Establish local port forward connection
- Turn off the VPN if on AWS

- ```oc login --token=sha256~wfUVqLuTLLERU9ohv3dphg4cNsLJivQdvcBPsV7DvHI --server=https://api.devcloud.awsdevcloud.com:6443```

- ```oc project postgresql-qa```

- ```oc get pods```

- ```oc port-forward postgresql-3-nc75j 15432:5432```

- oc get svc

- oc port-forward svc/devcloudr2dev-postgresql 15432:5432

## Reload Maven Project to download all dependencies
- Turn off the VPN

## Replace the application.properties with application-dev.properties

## Run the ByocApplication.java Main.
- Embedded Tomcat will run and also hikari connection pool will start on it's own thanks to local port forwarding

## Flyway
- flyway.url=jdbc:postgresql://localhost:15432/postgres?sslmode=require&user=devcloud&sslrootcert=C:\ca.crt&sslcert=C:\client.crt.der&sslkey=C:\client.key.pk8


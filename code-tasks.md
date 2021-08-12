# 23.06.2021















# 22.06.2021


## Migration Work
- //Make a merge request to prod branch.
- //Update the story and close it.
- Connect with Rupak to finish the jenkins.

## UX Work
- //Read Stories
- //Current UI (https://frontend-devcloud-dev.apps.cfa.devcloud.intel.com/#/login)
  - //Project
    - //Application (Remove the application)
  - //Mapping the tables and API




















# 21.6.21

### DB
- devcloud migrate
	- Reapply the changes to devcloud-r2-dev (Dev scripts to r2-dev)
	- Dev scripts to r2-qa
//	- QA scripts to devcloud-dev
//	- Review the changes

- Clone the appropriate branch[]
- Establish local port forwarding
- Take backup with custom
- Delete DB
- Configure script
- Run script
- Restore DB


## Connect with Sudeep

### Attend IOTG Session

### Courses
- IBM
- fabric8	

- Re - Migrate.  (Repair)
	devcloud-r2-qa
	- What users to add???????????????
	devcloud-r2-dev
	- What users to add?

- Jenkins??


- //Change the master password for all dbs.
- //Restrict who can merge to dev and qa directly.
- //Make sure dev is not merged to qa directly.





# Old

# What to do when someone updates the sql query
- He or she needs to communicate to all the microservice teams who are using the database.
- All of them needs to review their code and make updates to their code. (DAO). Need to make sure object relational mapping is consistent.
- There needs to be a system in place so that only compatible microservices are deployed together. Meaning say BYOC an BYOS are independent but still if they are using the same database, they need to be compatible with each other.
- So not just the API Contracts but also the ORM Contracts of all the microservices need to be synced with database and other microservices in deployment.
- Safe and effective rollback of migrations.

# Scale


# Web Based CLI

- When the user logs in the cli container will be deployed to his namespace
	- UI : Jupyter Lab
	- Terminal Functionality (Openshift websocket vs opensource vs custom)
		- Host : Container in user namespace or a separate build server
			- Docker (what's wrong with daemon?) vs BuidAh vs Podman inside this host : Build Ah to be used

# GUI Based Option
- Take Source URL
	
	- Languages to support (java and python)
	
		- Immediate Status of the language and build image
			- API for posting the complete form
					- (openshift-int-ms)Fabric8 to create buildconfig and image stream
			- API to verify git url
			- API to get list of builder images (straight from db?)
			- API to get list of image versions for each builder image (straight from db?)
		
		- User to provide dockerfile to specify how to build
		
		

# Questions
- Is build image the image where the source code is injected?
- For GUI Based are we planning both the scenarios?
- Is creating image stream and build image part of the API for posting complete form? or is that different?
	
August : Engg work done
September Mid : Bug
# Removing application from hierarchy

### Code changes
- Changes in DTO Layer, Projections, Model layer in application and project.
- Changes in repository layer, remove application and application_container.
- Changes in service layer
  - Project : (get details)
- All the constants need to be moved to proper package (Common/Project)?

### Changes to DB
- Remove application and application_container
- Create a new project_container table.
- Proper foreign key relationship between tables for cascade delete.

### Addition to Project
- container_termination_time??

### Questions
- Why was application even there, what additional functionality did it provide?
  - Hardware choice I think, it is now moved to launching container
- What is container termination time?
- How to continue after assigning and deploying.
- Why was I not able to provide a docker hub registry url?

# Status and Dashboard 
- Status of project current date?
- Status of container?
- Present day runtime status?

# Resource Lifecycle
- Resource is
  - It can be an Image
  - It can be a Source
  - It can be a helm chart
- So can a single resource be part of multiple projects?
  - Yes, based on whether the resource is part of any project or not, assigned status is set. 
  - User can select a assigned/unassigned resource and again assign it to different project using the drop down icon. 
- Resource lifecycle is independent from project
  - But you can only delete a resouce if it is unassigned i.e not linked to any project.
  - Manytomany relationship.
- Assigned Status?
  - Resource status assign is however linked to project i.e atleast one project_id should be there corresponsing to the container for it's status to be assigned?
  -  Container image in the resource library will be unassigned from this project?????

### Question
- Configuration is tied to Container. But in wireframe the configuration tied to projetc?????check this in wireframe.
  - See below for answer.


# Project Lifecycle
- What is project configuration?
  - No such thing.
- Logs
- Labels
- Results (Not currently using this table)



### Questions
- Why would  tag, container name be deleted from table on project delete?


Project Container (Many To Many) No Cascade
Configure Container????? (One to One)
Configure Project????? (  )


Current Configure


Source Image vs Container in UI??????


# 24.06.2021

- Configuration is at project level and for each container in project we can update the configuration(runtime) independently.
- Other type of configuration is in source images which is only for source type images.
- Only delete an unassigned resource.
- Unassigned
  - When built from CLI
  - When all projects are deleted
- Hardware will be chosed on launching the deployment.
  - Can be single container or multi container deployment.
- Compatible hardware???
- Queueing?
- Multicontainer? (Is it just multiple containers per deployment?)
- container termination time is editable

## R1 vs R2

### BYOC
- Container Dependency
- Dirty flag
- Container Name
- Container Config Request
  - dependencyOn
  - isInternalRepo
- Container Dependency Request is added.
- ContainerDeployRequest is now arraylist of containers
- Metadata??
  - containerName
  - image
  - comparisionId
  - deploymentId

## CLI


## Import Resources


## Source Images are added

# 25.06.2021
- Resources
- Image vs Container


## APIs
### Status APIs
- Do we need to show the dependencies in this page
```json
{
	project_id : 
	targets:[
		{
			target_name:
			target_status: (Not saved in DB but calculated by backend)
			containers:{
				container_name : 
				container_status : enum {
					RUNNING,
					CREATED,
					TERMINATED,
					QUEUED,
					ERROR
				}
			}
		},
		{
			target_name:
			target_status: (Not saved in DB but calculated by backend)
			containers:{
				container_name : 
				container_status : enum {
					RUNNING,
					CREATED,
					TERMINATED,
					QUEUED,
					ERROR
				}
			}
		},
		{
			target_name:
			target_status: (Not saved in DB but calculated by backend)
			containers:{
				container_name : 
				container_status : enum {
					RUNNING,
					CREATED,
					TERMINATED,
					QUEUED,
					ERROR
				}
			}
		}
	]
}
```

### Get Project API :
```json
{
	project_id:
	project_name:
	targets:[
		{
			target_name:
			target_status:
			target_exec_time:
			target_last_exec:
			target_size:
			containers:[
				{
					container_name:
					container_status:
					container_labels:
					container_exec_time:
					container_last_exec:
					container_size:
				},
				{
					container_name:
					container_status:
					container_labels:
					container_exec_time:
					container_last_exec:
					container_size:
				}
			]
		},
		{
			target_name:
			containers:[
				{
					container_name:
					container_status:
					container_labels:
					container_exec_time:
					container_last_exec:
					container_size:
				}
			]
		},
		{
			target_name:
			target_status:
			target_exec_time:
			target_last_exec:
			target_size:
			containers:[
				{
					container_name:
					container_status:
					container_labels:
					container_exec_time:
					container_last_exec:
					container_size:
				}
			]
		}
	]
}
```

## 28/6/21
- Compare with what exists today.
- See if multicontainer support exists in deployment.
  - Multiple deployments for multiple containers.


### Nomenclature

- Container -> Image used.
- Deployment -> Deployment of a specific type of image (only one pod per deployment)
- Pod -> Instance of a Container. 
- Deployment and Pod have one is to one mapping


### Logic 
- Get all deployments for project_id.
  - Group all deployments by target_name
  - target_status : combination of status of all containers.
  - target_size??
  - target_exec_time??
  - target_last_exec??
  - Get container_name from container_id (Does all the containers have the same name if originated from same image?)
  - labels?
  - last_updated_status - deployment_create_time == container_exec_time 
  - last_exec?? (empty for running??)
  - size??
  - status : get lastest pod status from deployment_id.

- Is there support of multiple containers within pod?
- Can you differentiate between the same image running on same project multiple times?
  - Per user the same container name
- What is comparision id? Will it help build up the dependency graph?
- grouping logic per target
- Grouping Target based on the time of deployment??


### Questions
- Is it single pod, single container.
- deployment-pod one to one mapping?
- How to group by target? Since target can be same type and still require new row based on when it was deployed. Is it comparision Id? Since that's how we are grouping today.
  - What is comparision id? Will it help build up the dependency graph? Do we need to give this information in the get api? (no, )
  - Grouping logic in UI or backend? (UI)
- Where to get size from?
  - new story
- What about target's properties? (Combination of individual properties?)
  - UI
- Per user the same container name
  - Yes, already exists
- I need to change in deployment Object, remove the application and replace with project.
  - Rename the application to project, comment out the project.
- Also do we need all the irrelevant fields podname, imagename, podId, projectDTO etc? 
  - Yes
- Make sure no one is using deployment, else UI will break or other things will break.
  - Use different version of the jar.
- Is there something wrong with r2-dev I am not able to move from the container setup screen.
- Can a same image be run on the same target/project multiple times?


## 29.06.2021
- Sriram
  - Make comparision ID global
  - Make current date global
  - Sit and debug why r2 not working.

- What is the get all project status
- Project level status?
  - pagination for targets
    - For all projects you need the top 3 targets
    - (limit only till x) 
  - target level status vs container level status
  - CREATING, CREATED, RUNNING, TERMINATED (Group the statuses)
  - https://jira.devtools.intel.com/browse/DCG2-1791 (???)
    - SCANNING???
    - QUEUEING
  - Project Level Status and Target Level Status???? 




- Pagination
  - Need Change in API Url.
  - Will be asked, not yet closed.
- Image Level Status
  - https://jira.devtools.intel.com/browse/DCG2-1791??
  - Not yet closed
- Project Level Status
  - https://jira.devtools.intel.com/browse/DCG2-1791??
  - Not yet closed



- /api/v1/pods (User API)
- Target Level Status (Bucketting)
  - Bucketting will be at UI Level.


Changes to deployment logic for grouping according to comparision id (done)
DTO Changes for bringing project<target<container hierarchy into the exisiting API. (done)
Project Level pagination. (half day)
Additional attribute added to the DeploymentDTO as well as the database for size.  (half day)\
Testing (Includes changes to existing unit test cases) (half day)



### Open points
- Pagination
- Target Status (UI or Backend)
- Get all projects API.

## 30.06.2021

- Talk to Vijay Sriraman
- Update the jira with story points and sub tasks
  

## 1.07.2021
- Pagination in Project level
- Pagination in Resource level
- What is a resource db?


## 2.07.2021

### Resource State (My Library -> Resources)
- Ready
- Not ready
- Error

### Pod Status (Backend is somewhat different)
- Running
- Created
- Creating
- Completed
- Terminated (Status which is to be shown in stop)
- Error

### Target Status (Bucket)
- Max Priority Status of the underlying pods.
- Error
- Running
- Completed (Terminated/ Completed)
- Queued Status is still not implemented.

### Some more insights
- Remove will only remove the deployments, not the project.
- One project one type

### Today's tasks
- Discuss regarding differnet Status in backend.
- [x] Pagination in Project Level


## 05.07.2021

- Investigate termination functionality
  - Target Level stop and remove.
    - Type attribute.
    - Comparision Id.
    - Batch Job (CRON Job)

## 06.07.2021

- [x] Give the token to Jagdish

- Test out the changes

- [x] Discuss the resource story.
  - build status?
  - 


- Last updated BYOS/HELM
  - BYOC -> Same as creation.
- Tell how much time to take.


### Discuss with UI



## 07.07.2021

### Discuss with Sudeep.

#### Dashboard
- Output (Logs)
  - Talk to Shashank
- [x] Filter/Sorting (UI/Backed) 
  - Out of scope
- [x] lastExecution
  - Nothing but createTime.
- null (in Target Name)
  - Add null filter in the Get pods API.

#### My Library
- Need project from BYOS API.
  - We need to make sure all the resources (helm/ container(BYOC)/ GUI S2I/ CLI S2I ) all have an entry in gen2_container table.
    - There is a challenge for CLI (since we don't store any information related to CLI in db, it is only stored in openshift cluster.) Lazy initialization?
    - How to get the associated projects for CLI resources.
  - When we assign any resource to any project, there should be an entry in project_container table.
  - Resources like helm and gui s2i can have tables like gen2_container_git and gen2_helm which have a one2one mapping with row in gen2_container table and are responsible to store additional informantion related to the resource.
  - Is it mandatory to assign project during import resource?
  - Should we also think about each ms gets it's own table, so when we in future go for single db per microservice, it is easier to migrate.
- We need both containerId and projectDTO in response.
- Does the tag in BYOC also needs to be appended to image name?
- Even BYOC should make sure on import of resources there should be a row in gen2_container, not in gen2_project_container. There should not be multiple rows in gen2_container on assigning resources to multiple projects.

#### Helm
- 

#### New stories
- Always OCR???
- 1914
- No restart option.


## 8/07/2021

#### Tasks
- Discuss with Sudeep and Jagdish regarding changes in search functionality.
  - Search for My Library (Discuss with Sudeep)
    - Search Project
    - Search Resources

- [x] Wait till Mujib is done with the merge to master.
  - [x] Mujib will send the branch.

- Discuss with BYOS and Sudeep regarding my library changes
  - Need to see how the container is added during import.
  - It shouldn't be added during linkage with project if already exists.
- We need to see how the resource is created.
    - BYOS -> GUI/CLI
  - HELM ->

- Discuss with Aditya for helm.
  - Delayed

- Discuss with Shashank for logs.
  - Delayed

- [x] Size will be null in BYOC resources.

- Cancel BYOS page registry.
  - Discuss with Sai

#### My Library
- Execution time is only relevant once the container ends.
- Shouldn't each MS has it's own GET API. (Pagination will be difficult.)
  - There would be no coupling of BYOC with other ms (thus BYOC wont become a monolith)
  - Easier for CRUD Support in future.
  - Everyone can return the same ResourceDTO stored in common-byoc.
  - Any new service say docker-compose comes, they can easily be integrated.


#### BYOC Flow

##### Project Creation with new Resource
- Container From Registry -> Project -> (external registry) with add this to internal registry enabled -> Import
    - Added in both gen2_container table and gen2_project_container table.
    - On deleting project, it is deleted from gen2_project_container only.
    - On deleting image, it is deleted from gen2_container if and only if no project is assigned to it.
  - What happens when he disables add this to internal registry 
    - Same as above.
    - Doesn't matter

- In this case where are we storing the resource
  - Is that functionality not existing yet?


##### Project Creation with existing resource
- Container From Registry -> Project -> Internal Registry -> Import
  - No new row should be added in the gen2_container table.
  - Only one more row added in the gen2_project_container table.


##### Project Creation with new Resource but same url exists
- Do we add a new 

## 09.07.2021
- Multiple assign of single resource/image in project?
  - How is Project Library going to be seen (Linked containers?)

## 12.07.2021
- How to show status for Helm and Docker Compose in dashboard.


### DCG2-1917

#### Import flow

- Import from Registry.
  - Import from Internal Registry
    - GET all Resources
    - Choose Resources and establish relationship.
      - Then no need for scanning.
      - Deploy.
  - Import from External Registry 
    - First check if the URL is already in Registry else there will be 2 image streams pointing to same url.
    - If Add this to internal registry is disabled :
      - then scanning,
      -  also no need to add to OCR and
      -   directly deploy, current flow.
    - If enabled 
      - then scanning
      - add to OCR
      -  and then deploy.


#### In Dashboard
- No changes

#### In My Library
- Only stored resources in resources?

##### Questions
- As of today, both resources which are imported and not improted are in resources.
- Is this option to save to internal registry not there in today's implementation?
- Different Container Name but same url??
- What is the current login (Is Internal Repo) (registryUrl)
- Why are we saving in both internal and external repo (673 : ContainerServiceImpl.java)



## 13.07.2021
- Will we even need a new column in db?
- New entry in the container table.


## Ux-Dx Meeting

- Assign unassign
- Unassign has to be removed from the resources.
- //We need to find the orchestration service.
  - UI is orchestrator.
- Helm in Dashboard
- //Don't create a new entry in the gen2_container table.
  - This is fine.
- Stop and all has to be rewritten for helm or docker compose.


## 14.07.2021


### Stop /Terminate
- If pod is in any other state rather than running, what should be the behavior?
- Helm stop/terminate not covered.
- Helm integration with dashboard is? 

### Vunerabilities
//- Are we allowing users to delete containers and deploy containers they shouldn't have access to?
//- There is an authorization layer remaining.

### Remaining Questions
- What if we have a current deployment going on, and we unassign from a project. Then delete the build from resources.
  - (We cannot delete from gen2_containers).
- 

#### Helm Stuff
- Helm in Dashboard
- Stop and all has to be rewritten for helm or docker compose.
- How will we send the helm association in GET Projects.



## 15.07.2021
- Unassigning an container with ongoing deployments.


## 16.07.2021

BYOS (gen2_source_build, gen2_project_container_source)
BYOC (gen2_container   , gen2_project_container)

### BYOS Flow Import

#### Resource Import (BYOS)
- First the user either imports by CLI/Build (Both cases gen2_source_build gets updated).

#### Project Creation and Resource Assign (BYOC)
- After this the user creates the project (BYOC) createContainer API (Multiple times based on number of resources selected). createContainer expects the url of the openshift registry.
  - BYOC (Update project_container table, Update gen2_container table).
    - BYOC Call BYOS (Update gen2_project_container_source table)
- The user should be able to see the project as assigned in resources tab and container assigned to project in project tab.
- User chooses the dependency graph.
  - this will update the gen2_project_container
- Now the user deploys the project on a target. (gen2_deployment, gen2_pod_status)
  - User can see the pod status in dashboard.

#### Resource Unassign (Config MS)
- Now the user unassigns the resource (config ms)
  - configms (Update the project_container table)
    - configms Calls BYOS (Update gen2_project_container_source table).

#### Resource Assign to same project (Config MS)
- (Only update the gen2_project_container and gen2_project_build) (configms -> BYOS)

#### Resource Unassign again
- Same as above.

#### Resource Delete (Maybe out of scope)
- Now a resource if unassigned can be deleted.
- ****** On Delete the call goes directly to BYOS
  - BYOS deletes the resource in (gen2_source_build)
  - ****** (The issue is even if the resource is deleted, the entry in gen2_container is there.)

#### Resource Reimport with same name and then assign
- What can be done in this case?
	- Can we give it a different container id and be fine with it?
	- 2 Containers with same name in gen2_container table.

#### Resource rename url???????
	- Possibly the url in registry remains the same.

(One thing that can be done is resource can only be deleted/ edited (url) if there is no other running pod of that container).
	- Requires a new API in BYOC.

- Or modify (possibly a lot) of exisiting logic to remove pod to gen2_container relationship.








### Questions
- How do I know when to call the BYOS Service to assign (KIND == Source) will this be applicable for CLI Builds?
- If the gen2_container already has a resource of this name what to do?
- Is edit url a part of this release?
  - How to bridge between container_id and source_build_id. Required in case of editing.
    - Ans : Might not need
- I can assign and unassign, but how will the deployment know from gen2_container where to fetch from?
  - Ans : From the url

### BYOC Imported Resources?



### BYOS Flow

#### Database

BYOS (gen2_source_build, gen2_project_container_source_tag_user)
BYOC (gen2_container   , gen2_project_container)


#### Resource Import (BYOS)
- First the user either imports by Build (Both cases gen2_source_build gets updated).

#### Project Creation and Resource Assign (BYOC)
- After this the user creates the project (BYOC) createContainer API/ Assign API (Multiple times based on number of resources selected and containerId present or not). createContainer expects the url of the openshift registry.
  - BYOC (Update project_container table, Update gen2_container table).
    - BYOC Call BYOS (Update gen2_project_container_source table)
- The user should be able to see the project as assigned in resources tab and container assigned to project in project tab.
- User chooses the dependency graph.
  - this will update the gen2_project_container
- Now the user deploys the project on a target. (gen2_deployment, gen2_pod_status)
  - User can see the pod status in dashboard.

#### Resource Unassign (Config MS)
- Now the user unassigns the resource (config ms)
  - configms (Update the project_container table)
    - configms Calls BYOS (Update gen2_project_container_source table).

#### Resource Assign to same project (Config MS)
- (Only update the gen2_project_container and gen2_project_build) (configms -> BYOS)

#### UI
- Import Container From Registry (Should call createContainer/assign API multiple times based on container Id).
  - Should give type of resource (container/build)
  - Should also give url of the openshift registry.
- In MyLibrary Resource
  - Unassign -> ConfigMs API
  - Assign 
    - If container_id == null then createContainer API
    - If container_id != null then configMs API

In GET Resource API to UI :
	3 Types of resource is possible.
		- Resource with only image_id; (Call create Container API).
		- Resource with image_id and container_id; (Call Config MS Assign API)
		- Resource with image_id, container_id and list<project_id> (Call Config MS Assign API)

#### BYOS
- GET Resource API (container_id, resource_name, assigned/not)
- ASSIGN API (container_id, resource_id, project_id)
- UNASSIGN API (resource_id, project_id)


#### BYOC
- Create Container should have an image id.

gen2_resource 
gen2_user_resource_project  (30)
gen2_user_resource_container (3)


10 Project (3 resources)



## 19.07.21
- Test by bring config ms down as well.


### BYOC
- *//Assign on createContainer
- *//Assign on explicit assign
- *//Unassign on project Deletion.
- *//Unassign on explict unassign.
- //Make changes in the restTemplate.



## 22.07.21
//- Execution Time
//- isStopped
- Test Stop/Remove functionality
//- Assign Unassign Functionality.
//- creating error should go to error.
- Devcloud user new for insert and update the rows.
  - Parked for later.
//- Share the design document
//- Project should have container Ids.



Yesterday worked on : 
- Verifying the DCG2-2246 story locally, raised PR.
- There were changes in existing pod status API and remove API that was needed.
- devcloud-dev db had issues so that also had to be synched up.


## 23.07.21
- Getting my changes deployed
- //There is one bug assigned DCG2-2357, will talk with Viraj regarding that.
- Test by bring config ms down as well.
- Revert logic of assign with unassign.
//- Add byos to properties and jenkins.
- For normal containers we have to skip the assign BYOC Part.


## 26.07.21
Take a flag for external registry.
- array of containers to be provided.
- createprojmapping (add byos in here), also take isexternalurl and if true don't send to byos. (If containerId != null)
- If containerId not equal null existing flow. Also send isexternalurl there as well.
- assignAPI
- unassignAPI

## 27.07.21
- //Might discuss DCG2-2392.
- DELETE Project : (Delete from their tables itself).
- Bulk creation of containers.
- Figure out a way to login with certs.
- Check with Shashank for logs.
- Validate the userId is same.
- URL is grey area.

## 29.07.21
- //Blocker Bug
- //Discuss with Sudeep
- //Bulk creation of containers.
- //Validate the userId is same.
- //Figure out a way to login with certs.
- //List of ProjectIds to Details
- //DELETE Project : (Delete from their tables itself).
- //Delete Container if no other project is assigned to it.





## 30.07.21

### Previous Day
- Migrated db in devcloud-qa
- Blocker Bug analysis
- Implemented some code needed for integration with UI
  - Bulk creation of containers.
  - Returning list of project Ids.
  - Deleting Project should also delete BYOS DB Rows.


### Today
- Test on devcloud-r2.
//- Deploy db scripts on onprem dev and qa.
- Will discuss with Shashank


## Later 
- Plan github migration for devcloud-db
- Retry logic for assign.
- Error (name)


## 5.08.21

url : docker.io/rupak91/openshift:script
containername : randomname:326
imageStream : randomname:script

url : docker.io/rupak91/openshift
containerName : randomname
imageStream : randomname:latest


- For complete assign flow (BYOC)
	- //isInternalRepo (true) -> Sudhansh
	- //containerName (with the tag) -> Me
	- //containerId not 0 (null/validId) -> Sachin

```sql
select* from gen2_resource_project grp where user_id = 1038;
select* from gen2_resource_container grc where user_id = 1038;
select * from gen2_container gc where user_id =1038;
```


## 06.08.21
- //Pod Status API not displaying anything.
- //Deploy to r2-dev.
- Delete container with isInternalRepo=false in case of project delete.
  - Will be talked with Mujib
- PR review.
- Fix the bugs.


## 09.08.21
//- Resolve the blocker bugs.
//- Talk to Prabhat for delete container.

- Talk to Sudeep on dashboard polling thing.


## 10.08.21
- [x] Discuss with Sudeep regarding container Names
```
containerName : random:latest
url : docker.io/manish/openshift
gen2_container : random:latest
resourceName : random:latest

containerName : random
url : docker.io/manish/openshift:script
gen2_container : random:script
resourceName : random:script

containerName : random
url : docker.io/manish/openshift:script2
gen2_container : random:script2
resourceName : random:script2

containerName : random:script
url : docker.io/manish/openshift
gen2_container : random:script
resourceName : random:script

containerName : random
url : os:script
gen2_container : random:script
resourceName : random:script
```

- [x] Details in the bulk container API.

- [x] Work with Sachin to tackle the issue of duplicate entries.
```sql
ALTER TABLE public.gen2_resource_container ADD CONSTRAINT gen2_resource_container_pk PRIMARY KEY (id);

ALTER TABLE public.gen2_resource_container ADD CONSTRAINT gen2_resource_container_uk UNIQUE (user_id, resource_name);

ALTER TABLE public.gen2_resource_container RENAME CONSTRAINT gen2_secret_detail_user_fk  TO gen2_resource_container_user_fk;

ALTER TABLE public.gen2_resource_project ADD CONSTRAINT gen2_resource_project_pk PRIMARY KEY (id);

ALTER TABLE public.gen2_resource_project ADD CONSTRAINT gen2_resource_project_uk UNIQUE (user_id, resource_name, project_id);

ALTER TABLE public.gen2_resource_project RENAME CONSTRAINT gen2_secret_detail_user_fk  TO gen2_resource_project_user_fk;
```


- (Add don't catch runtime exceptions)

- select * from hibernate_sequence;


External -> abc -> (Internal) -> gen2_container (abc) (Image Stream) (abc:latest) (Assigned)
{
  - Delete API (BYOS Resource) ||
}

byos (Image) abc -> (Image Steram) abc:latest
External Container (cName) abc -> abc (gen_container abc) -> Image Stream (abc:latest) 

abc:latest
url :docker.io/open:latest -> 
url :docker.io/open:script


## 12.08.21
- [x] Close the bug legacy
- [x] Deploy to QA.
  - Deploy logic to change to handle all image names. : This is a task to do.
  - If container name is appended then we also need to handle every other tagName character during creation of image stream. : Contaienr Name not appended
  - Invalid tag names container creation issue. : Remove regex.
- [x] Talk to Mangal
- Kafka Issue
  - Fix the header related issue in kafka.
- B R
- Pay HSBC




## 13.08.21
- Remove the special characters from tagName
- Remove regex from container Name
- Publish Kafka Message on openshift
- Run DB Scripts on dev.
- SDLE Task (storage-ms)
- ClockWork Task
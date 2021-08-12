### Clean the Database
	
- Disconnect VPN
- get login command https://console-openshift-console.apps.devcloud.awsdevcloud.com (kubeadmin hEEsV-yULNf-L53nz-CFApA)
- oc login --token=sha256~KY_7IK5dhjzw2WPPH1rvksc2i7BgOenIx7tg09OynZo --server=https://api.devcloud.awsdevcloud.com:6443
- oc project postgres
- oc get pods (postgres-1-m4wpg)
- oc port-forward postgres-1-m4wpg 15432:5432
- Login to DBeaver
  - Delete schema manually(drop schema public cascade; 
  - (delete devcloud manually) DROP OWNED BY devcloud;
    - delete devcloud role
  - create schema public;

### Gitlab
- Connect to VPN
- Make sure you have only 3 files in script

### Local git have a script file ready

------------------------------------------------

### Port Forwarding
- Disconnect from VPN
- Setup oc login before hand.
- Setup port forwarding.

-------------------------------------------------------------------

### Show Database
- Disconnect from VPN
- Show that there is nothing in DBeaver

### Gitlab
- Connect to VPN
- Show demo-manish github branch with 3 initial github files.
 
### Run Jenkins
- https://automate.software-recipes.intel.com/
- dev-onprem >> postgres-dev >> Build with Parameters >> Status >> Console Output

### Show database 
- Disconnect to VPN and port forward
- Show that new tables have appeared

### Gitlab push
- Connect to VPN.
- Push sql script.

### Run Jenkins
- Run Jenkin's build again

### Port Forwarding
- Disconnect from VPN.
- Reconnect port forwarding.
- Show the newly added users in DBeaver.
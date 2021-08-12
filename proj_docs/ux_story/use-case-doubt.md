Import the postgresql resource and assign to Project (added to gen2_container, project_container_table) -> 
	Deploy -> (deployment_status) and (pod_status)

Project (Unassign postgresql) (removed from project_container table) and then delete the container.
	Deploy -> keeps going..... (Get pod status) works if gen2_container has entry.

The problem is even after deleting a container we are keeping a gen2_container entry

Import the same resource and assign to Project (can't add same resource name to gen2_container since already exists)
	- We need to fix that.
# UX-DX Design Document (MANISH)

## GET DASHBOARD DETAILS

### REQUEST URL
```GET byoc.url/api/v1/pod```

### API RESPONSE

```json
{
  "listProjects": [
    {
      "projectDTO": {
        "additionalConfig": "string",
        "containerTerminationTime": 0,
        "createTime": "2021-07-20T06:09:08.863Z",
        "dependencyOn": "string",
        "description": "string",
        "entryPoint": "string",
        "mountPoint": "string",
        "name": "string",
        "portValues": "string",
        "projectId": 0,
        "result": "string",
        "updateTime": "2021-07-20T06:09:08.863Z"
      },
      "targets": [
        {
          "comparisonId": "string",
          "createTime": "2021-07-20T06:09:08.863Z",
          "deployments": [
            {
              "comparisonId": "string",
              "compute": "string",
              "containerCreationDate": "2021-07-20T06:09:08.863Z",
              "containerId": 0,
              "containerName": "string",
              "cpu": "string",
              "createTime": "2021-07-20T06:09:08.863Z",
              "deploymentId": "string",
              "executionTime": 0,
              "gen": "string",
              "imageName": "string",
              "lastJobExecution": 0,
              "path": "string",
              "podId": "string",
              "podIp": "string",
              "podName": "string",
              "projectDTO": {
                "additionalConfig": "string",
                "containerTerminationTime": 0,
                "createTime": "2021-07-20T06:09:08.863Z",
                "dependencyOn": "string",
                "description": "string",
                "entryPoint": "string",
                "mountPoint": "string",
                "name": "string",
                "portValues": "string",
                "projectId": 0,
                "result": "string",
                "updateTime": "2021-07-20T06:09:08.863Z"
              },
              "status": "string",
              "tags": [
                {
                  "tagDescription": "string",
                  "tagName": "string"
                }
              ],
              "userId": 0,
              "variant": "string"
            }
          ],
          "executionTime": 0,
          "lastJobExecution": 0,
          "targetName": "string",
          "targetStatus": "string"
        }
      ]
    }
  ],
  "pageNumber": 0,
  "pageSize": 0,
  "projectCount": 0,
  "userId": 0
}
```
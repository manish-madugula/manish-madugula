[x] 172.30.7.37:9200 (Connection reset by peer; nested exception is java.lang.RuntimeException: Connection reset by peer)
[x] https://elasticsearch-openshift-logging.apps.cfa.devcloud.intel.com:443 
[x] elasticsearch-openshift-logging.apps.cfa.devcloud.intel.com:443 Connection is closed; nested exception is java.lang.RuntimeException: Connection is closed
[x] elasticsearch-openshift-logging.apps.cfa.devcloud.intel.com  No route to host; nested exception is java.lang.RuntimeException: No route to host
[ ] https://elasticsearch-openshift-logging.apps.cfa.devcloud.intel.com:9200

- No route to host; nested exception is java.lang.RuntimeException: No route to host (RANDOM URL)


# With ssl
[x] https://elasticsearch-openshift-logging.apps.cfa.devcloud.intel.com:443 with ssl
[x] https://elasticsearch-openshift-logging.apps.cfa.devcloud.intel.com:9200 with ssl (Runtime Exception)
[x] https://elasticsearch-openshift-logging.apps.cfa.devcloud.intel.com with ssl (Dead)
[x] elasticsearch-openshift-logging.apps.cfa.devcloud.intel.com:443 with ssl (path building failed)
[x] 172.30.7.37:9200 with ssl (path building failed)
[ ] elasticsearch-openshift-logging.apps.cfa.devcloud.intel.com:9200 with ssl
[ ] elasticsearch-openshift-logging.apps.cfa.devcloud.intel.com with ssl




# Elastic pods
- 9xj (T02:30:07,729) 2021-08-02T02:30:07,729
- v9h (2021-08-02T07:30:10,878) [2021-08-02T10:45:11,167]
- spb ()

curl -k -H "Authorization: Bearer sha256~4n6yX7Wg-PnL-FPDEsRwuSP6zLmG7cJO7SDZ3Iz67SA" 172.30.7.37:9200

oc rsh --container execution-ms execution-12-djbdc


{
  "_source": [ "message","kubernetes.pod_name" ],
  "query": {
        "bool": {
            "must": [
                {
                    "match": {
                        "kubernetes.pod_name":"devcloudr2dev-postgresql-read-1"
                    }
                },
                {
                    "match": {
                        "kubernetes.namespace_name" : "devcloud-r2-dev"
                    }
                }
            ]
        }
    }
}

{"_source":[],"query":{"bool":{"must":[{"match":{"kubernetes.pod_name":"devcloudr2dev-postgresql-read-1"}},{"match":{"kubernetes.namespace_name":"devcloud-r2-dev"}}]}}}
echo "Logging into openshift....r2 dev"
set https_proxy=http://proxy-iind.intel.com:912
oc login -u=manish -p=Manish@Intel!ndia --server=https://api.cfa.devcloud.intel.com:6443
oc project devcloud-r2-dev
oc port-forward svc/devcloudr2dev-postgresql 15432:5432
echo "Logging into openshift....dev"
set https_proxy=http://proxy-iind.intel.com:912
oc login -u=manish -p=Manish@Intel!ndia --server=https://api.cfa.devcloud.intel.com:6443
oc project devcloud-dev
oc port-forward svc/devclouddev-postgresql 15432:5432
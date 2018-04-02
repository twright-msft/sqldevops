#If needed, login and set the right subscription
# az login
# az account set -s 'your subscription if you have more than one'

#add some required providers
az provider register -n Microsoft.ContainerService
az provider register -n Microsoft.Compute
az provider register -n Microsoft.Network

#create a resource group to contain everything
az group create -n trainingRG -l eastus

#create a Kubernetes cluster
az aks create -g trainingRG \
    -n trainingcluster \
    --node-count 1 \
    --node-vm-size Standard_D2s_v3 \
    --generate-ssh-keys

#optionally scale up the number of nodes
# az aks scale \ 
#     -g trainingRG \
#     -n trainingcluster \
#     --node-count 5 \

#install the command line tools if you dont already have kubectl
#az aks install-cli

#get the credentials to access the Kubernetes cluster
az aks get-credentials \
    -g trainingRG \
    -n trainingcluster

#get the information about the cluster
kubectl cluster-info
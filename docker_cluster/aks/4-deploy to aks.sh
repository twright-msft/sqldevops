#create a namespace for creating everything
kubectl apply -f namespace.yml

#create a persistent volume claim
kubectl apply -f pvc.yml

#wait for this to return that the PVC is BOUND before continuing!
kubectl get pvc -n production

#create the SQL Server stateful set in the production namespace
kubectl apply -f sql-statefulset.yml

#create the web app in the production namespace
kubectl apply -f webapp.yml

#show the pods and services
kubectl get pods -n production
kubectl get services -n production
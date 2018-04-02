#create a namespace for creating everything
kubectl apply -f namespace.yml

#create a persistent volume claim
kubectl apply -f pvc.yml

#wait for this to return that the PVC is BOUND before continuing!  Typically takes 1 minute.
kubectl get pvc -n production

#create the SQL Server stateful set in the production namespace
kubectl apply -f sql-statefulset.yml

#create the web app in the production namespace
kubectl apply -f webapp.yml

#show the pods and services.  WAIT for pods to finish deploying.  SQL pod takes 4-5 minutes.
kubectl get pods -n production
kubectl get services -n production
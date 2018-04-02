#get a bash prompt inside of the container
kubectl exec -ti mssql-0 -n production bash

#run following commands in the kubernetes container terminal
cd /var/opt/mssql
mkdir -p backup
cd backup

#download the wide world importers backup file and restore script
wget https://github.com/Microsoft/sql-server-samples/releases/download/wide-world-importers-v0.2/WideWorldImporters-Full.bak
wget https://raw.githubusercontent.com/erickangMSFT/sqldevops/master/docker_cluster/aks/restore.sql

#restore the backup.  takes about 30 seconds.
/opt/mssql-tools/bin/sqlcmd -Usa -PSqlDevOps2017 -i restore.sql
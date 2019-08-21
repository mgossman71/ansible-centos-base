#!/bin/bash
for ns in $(kubectl get ns | awk '{print $1}'|grep -v NAME)
do
  consul kv put k8s-cluster/namespaces/$ns "$(kubectl get ns $ns -o yaml)"
  kubectl config set-context --current --namespace=$ns
  for dp in $(kubectl get deployments| awk '{print $1}'|grep -v NAME)
  do
    consul kv put k8s-cluster/$ns/deployments/$dp "$(kubectl get deployment $dp -o yaml)"
  done
  for sv in $(kubectl get svc| awk '{print $1}'|grep -v NAME)
  do
    consul kv put k8s-cluster/$ns/services/$sv "$(kubectl get svc $sv -o yaml)"
  done
done

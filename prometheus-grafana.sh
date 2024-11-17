#!/bin/bash
#Add prometheus helm charts
helm repo add prometheus https://prometheus-community.github.io/helm-charts
sleep 60
#Add grafana helm charts
helm repo add grafana https://grafana.github.io/helm-charts
sleep 60
kubectl create ns monitor-ns
#helm upgrade --install prometheus  prometheus/prometheus -n monitor-ns -f prometheus_values.yml
ls -lart
helm upgrade --install prometheus  prometheus/prometheus -n monitor-ns -f prometheus_values.yml -f alertmanager_rule_11_9_24.yml

sleep 60

#Grafana
helm upgrade --install  grafana grafana/grafana  -n monitor-ns

sleep 60
kubectl get secret --namespace monitor-ns grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo

kubectl apply -f montoring_rules.yml

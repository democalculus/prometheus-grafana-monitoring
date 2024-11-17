#!/bin/bash

kubectl create ns monitor-ns
helm upgrade --install prometheus  prometheus/prometheus -n monitor-ns -f prometheus_values.yml
helm upgrade --install prometheus  prometheus/prometheus -n monitor-ns -f prometheus_values.yml -f alertmanager_rule_11_9_24.yml

kubectl apply -f montoring_rules.yml

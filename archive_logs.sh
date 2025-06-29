#!/bin/bash
NAMESPACE="production"
for pod in $(kubectl get pods -n $NAMESPACE -o jsonpath='{.items[*].metadata.name}'); do
    kubectl logs $pod -n $NAMESPACE > ~/logs/$pod.log
done
tar -czf k8s-logs-$(date +%F).tar.gz ~/logs/

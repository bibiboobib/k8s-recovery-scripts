#!/bin/bash
NAMESPACE="app"
LOG_FILE="/var/log/pod_restart.log"
kubectl get pods -n $NAMESPACE | grep -E "CrashLoopBackOff|Error" | while read -r pod ; do
  POD_NAME=$(echo $pod | awk '{print $1}')
  echo "Restarting pod: $POD_NAME at $(date)" >> $LOG_FILE
  kubectl delete pod $POD_NAME -n $NAMESPACE
done
curl -s -X POST https://api.telegram.org/bot<YOUR_BOT_TOKEN>/sendMessage -d chat_id=<YOUR_CHAT_ID> -d text="Failed pods restarted in $NAMESPACE at $(date)"

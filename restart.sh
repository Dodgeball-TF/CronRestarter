#!/bin/sh
# Script to restart deployments with a specific label

# Use environment variables, with defaults if not set
LABEL_SELECTOR="${LABEL_SELECTOR:-app=special-app}"  # Default label if not provided
NAMESPACE="${NAMESPACE:-default}"                    # Default namespace if not provided

# Get deployments with the specific label
DEPLOYMENTS=$(kubectl get deployment -n $NAMESPACE -l $LABEL_SELECTOR -o name)

# Loop through and restart each deployment
for DEPLOYMENT in $DEPLOYMENTS; do
    kubectl rollout restart $DEPLOYMENT -n $NAMESPACE
done

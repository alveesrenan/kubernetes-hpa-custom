#!/bin/bash
check_status() {
  if [[ $1 != 0 ]]; then
    echo
    echo $2
    exit $1
  fi
}

CHART_NAME=kubernetes-hpa-custom
CHART_VERSION=1.0.0
CHART_NAMESPACE=default
HELM_EXTRA_CMD='--atomic --recreate-pods'

helm upgrade --install $CHART_NAME ./$CHART_NAME --version $CHART_VERSION --namespace $CHART_NAMESPACE \
    --recreate-pods --atomic --cleanup-on-fail
check_status $? 'Error when upgrading/installig helm chart.'

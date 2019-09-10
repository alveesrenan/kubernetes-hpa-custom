#!/bin/bash
check_status() {
  if [[ $1 != 0]]; then
    echo
    echo $2
    exit $1
  fi
}
CHART_NAME=kubernetes-hpa-custom
CHART_NAMESPACE=default

helm install --name ${CHART_NAME} --namespace ${CHART_NAMESPACE} ./helm
check_status $? 'Error when installing helm chart.'
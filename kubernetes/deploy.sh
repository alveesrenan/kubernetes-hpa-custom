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
CHART_NAMESPACE=eap-dev
HELM_EXTRA_CMD='--atomic --recreate-pods'
PROXY=

if [[ $1 == 'emb' ]]; then
  PROXY=http://$2:$3@lnx237in.sjk.emb:9090
fi

docker run --rm -e "HELM_CHART=${CHART_NAME}" -e "CHART_NAMESPACE=${CHART_NAMESPACE}" -e "HELM_CHART_VERSION=${CHART_VERSION}" \
  -e "HELM_EXTRA_CMD=${HELM_EXTRA_CMD}" -e "https_proxy=${PROXY}" -e "http_proxy=${PROXY}" \
  503622861177.dkr.ecr.us-east-1.amazonaws.com/kubectl-helm-eap:2.14.3-aws sh deploy-cmd.sh
check_status $? 'Error when upgrading/installig helm chart.'
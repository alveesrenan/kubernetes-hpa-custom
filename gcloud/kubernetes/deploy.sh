#!/bin/bash
check_status() {
  if [ $1 != 0 ]; then
    echo
    echo $2
    exit $1
  fi
}

helm install --name=decoder-acars helm
check_status $? 'Error create decoder-acars helm chart.'
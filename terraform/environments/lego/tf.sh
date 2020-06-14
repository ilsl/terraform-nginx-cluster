#!/usr/bin/env bash

action="$1"

if [[ "$action" == 'init' ]]; then

  export GOOGLE_APPLICATION_CREDENTIALS=/tmp/lego-npd.json
  export GOOGLE_PROJECT="lego-npd"

  gcloud container clusters get-credentials lego-kubernetes-cluster --project lego-280115 --zone europe-west1
  gcloud config set project $GOOGLE_PROJECT

  terraform init
fi

if [[ "$action" == 'plan' ]]; then
  terraform plan \
    -input=false \
    -var-file="tfvars/npd-main.tf"
fi

if [[ "$action" == 'apply' ]]; then
  terraform apply \
    -input=false \
    -auto-approve \
    -var-file="tfvars/npd-main.tf"
fi

if [[ "$action" == 'destroy' ]]; then
  terraform destroy \
    -input=false \
    -auto-approve \
    -var-file="tfvars/npd-main.tf"
fi
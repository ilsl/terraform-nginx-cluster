# Terraform Nginx Cluster

## Introduction

This repository contains code to deploy nginx web application onto a kubernetes cluster running behind an (External HTTP(S) Load Balancer)(https://cloud.google.com/load-balancing/docs/https).
3 replicas containers are serving the traffic as part of a Kubernetes deployment. 

## Prerequisites

* provider.google: version = "~> 3.25"
* provider.kubernetes: version = "~> 1.11"


## Assumptions
- Have a connection to the internet
- That the site doesn’t have to be externally accessible
- That the url could have a more meaningful name of nasa instead of SP-4206

## Running the code

1. Clone the repository

    ```console
    $ git clone https://github.com/ilsl/terraform-nginx-cluster.git
    ```

2. Change your working directory to lego:

    ```console
    $ cd terraform-nginx-cluster/terraform/environments/lego
    ```
    
3. Initialise terraform and project env variables

    ```console
    $ ./tf.sh init
    ```
    
4. Run Terraform plan - check you are happy with the resources to be deployed

    ```console
    $ ./tf.sh plan
    ```
    
5. Run the below to apply those change to GCP

    ```console
    $ ./tf.sh apply
    ```
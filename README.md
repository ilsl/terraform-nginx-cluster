# Terraform Nginx Cluster

## Introduction

This repository contains code to deploy nginx web application onto a kubernetes cluster running behind an [External HTTP(S) Load Balancer](https://cloud.google.com/load-balancing/docs/https).
3 replicas containers are serving the traffic as part of a Kubernetes deployment. 

## Prerequisites

+ Bash
+ Terraform v0.12.26
+ provider.google v3.25.0
+ provider.kubernetes v1.11.3
+ Access to the json key to authenticate to the google cloud lego-npd project (stored locally in /tmp dir)

## Assumptions

+ Have a connection to the internet
+ No need for solution to have static ip
+ Code is set up for web app k8 deployments in mind. If to be used for something else, folder structure might need to be tweaked

## Running the code

1. Check that the json key is present locally in the following location: `/tmp/lego-npd.json`

2. Clone the repository

    ```console
    $ git clone https://github.com/ilsl/terraform-nginx-cluster.git
    ```

3. Change your working directory to lego:

    ```console
    $ cd terraform-nginx-cluster/terraform/environments/lego
    ```
    
4. Initialise terraform and project env variables

    ```console
    $ ./tf.sh init
    ```
    
5. Run Terraform plan - check you are happy with the resources to be deployed

    ```console
    $ ./tf.sh plan
    ```
    
6. Run the below to apply those change to GCP

    ```console
    $ ./tf.sh apply
    ```

7. Once finished, you can clean up and remove all resources by running

    ```console
    $ ./tf.sh destroy
    ```
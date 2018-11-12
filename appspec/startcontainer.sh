#!/bin/bash
$(aws ecr get-login --no-include-email --region us-west-2)
sudo docker pull https://924781870100.dkr.ecr.us-west-2.amazonaws.com/mwan-629/pywebapp:latest || {
    echo "ERROR: docker pull failed. Sleeping for 10 minutes to allow investigation..."
    sleep 600
    exit 1
}
sudo docker run --name pywebapp -p 80:8080 --detach https://924781870100.dkr.ecr.us-west-2.amazonaws.com/mwan-629/pywebapp:latest

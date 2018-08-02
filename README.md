# Docker-Magento2-Base

[![wercker status](https://app.wercker.com/status/888d07ab366a399e0b0ecf906284fe38/s/ "wercker status")](https://app.wercker.com/project/byKey/888d07ab366a399e0b0ecf906284fe38)

[![Docker build](http://dockeri.co/image/mshahmi/docker-magento2-base)](https://hub.docker.com/r/mshahmi/docker-magento2-base/)

## Introduction
This is where we baked our Magento2 Base Image due to download the file using composer is time consuming.

In this part , we're using wercker to automatic build the dockerfile and once the build is success , we will push to the docker hub

## Wercker : Application environment variables

As in our wercker file , we required to pass some of the parameter such as :

  * MAGENTOPUBKEY   
  * MAGENTOPRIVKEY
  * DOCKER_USERNAME
  * DOCKER_PASSWORD

Thus , you need to set the environment parameter in the Wercker with the correct value.

## MAGENTOPUBKEY & MAGENTOPRIVKEY
It is used to download the Magento2 via composer

## DOCKER_USERNAME & DOCKER_PASSWORD
It is used to push latest docker images to Docker Hub
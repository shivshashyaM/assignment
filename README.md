# Introduction
This file can be refered to step by step approach on how an application can be deployed on Kubernetes cluster.

# Pre-Requisties
* GitHub repository
* Docker repository
* Docker
* Kubernetes (minikube or K3s)
* Application to be deployed

# Requirements
* Jenkins
* Dockerfile
* CI/ CD Pipeline
* Jenkinsfile
* yaml files
* Kubernetes CD Plugin

# Installation 
* Minikube or K3s
* Docker desktop
* Jenkins
* wsl

# Steps To Deploy Application

This command will be used to start minikube in command prompt
 * Minikube start in Cmd
 
These commands will fetch namespaces and create new namespace in minikube
 * kubectl get namespaces
 * kubectl create namepace namespace
 * kubectl get namespaces // To fetch nes namespace

This command will clone repository from gitlab link into local machine
 * git clone <Gitlab link>
 
These commands will push cloned gitlab repository from local machine into github repository
 
 * git status 
 * git add .
 * git commit -m "commit" 
 * git remote add origin (github link)
 * git remote -v
 * git push -u origin master
 
# Jenkins deployment

kubectl create -f jenkinsdeployment.yaml -n namespace

kubectl create -f jenkinsservice.yaml -n namespace

To access jenkins server
minkube service --url -n namespace


# Building docker image for that we need to have Dockerfile in local system
 docker build -t dockerrepositeryname/imagename .
 
# Push the build image to dockerhub repository
 docker login
 docker push dockerrepositeryname/imagename:tag
 
# Push kubedeployment.yam to github repository
 git status
 git add .
 git commit -m "commit"
 git remote -v
 git push -u origin master
 
 # Creating CI/CD pipeline
## Adding plugins to Jenkins server
 Docker pipeline plugin
## Download kubernetes-cd plugin (provided in github repository)

# Push Jenkinsfile to github repository
 git status
 git add .
 git commit -m "commit"
 git remote -v
 git push -u origin master
 
# Add user credentials for dockerhubregistery and kubernetes in jenkins manage credentials
  Use kubeconfig for kubernetes

# Run pipeline through jenkins interface
 Click on add new item
 Enter item name and select pipeline press ok
 Go to pipeline section
 Select Poll SCM under Build triggers
 Select in definition Pipeline script from SCM  
 Select Git in SCM
 Add your github repository
 Add Jenkinsfile under Script Path
 Clink apply and then save
 Clink on Build now and wait for pipeline to trigger
 
 

 
 

 
  
  



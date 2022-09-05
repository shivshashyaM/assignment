# Introduction
This file can be refered to step by step approach on how an application can be deployed on Kubernetes cluster using CI/CD pipeline integration.

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
 * minikube start
 
These commands will fetch namespaces and create new namespace in minikube
 * kubectl get namespaces
 * kubectl create namepace namespace
 * kubectl get namespaces // To fetch newly created namespace

This command will clone repository from gitlab link into local machine
 * git clone Gitlab link
 
These commands will push cloned gitlab repository from local machine into github repository
 
 * git status 
 * git add .
 * git commit -m "commit" 
 * git remote add origin github link
 * git remote -v
 * git push -u origin master
 
 These commands will initiate Jenkins deployment
 * kubectl create -f jenkinsdeployment.yaml -n namespace //added jenkinsdeployment.yaml file in github repository for reference
 * kubectl create -f jenkinsservice.yaml -n namespace //added jenkinsservice.yaml file in github repository for reference

These commands will be used to access jenkins server
 * minkube service --url -n namespace
 
Steps to create docker image
 * create Dockerfile
 * add to git repository // This will be done through git commands
 
This command will be used for building docker image needed for deploying application in kubernetes cluster
 *  docker build -t dockerrepositoryusername/imagename .
 *  docker images

These commands will push build image to dockerhub repository
 * docker login
 * docker push dockerrepositoryusername/imagename:ta>
 
These commands will push kubedeployment.yaml to github repository //kubedeployment.yaml is added in repository for reference
 * git status
 * git add .
 * git commit -m "commit"
 * git remote -v
 * git push -u origin master
 
 # Steps to initiate CI/CD pipeline.
  Add plugins to Jenkins server 
 * add Docker pipeline plugin
 * download kubernetes-cd plugin // This is added to github repository for reference

  Push Jenkinsfile to github repository
 * git status
 * git add .
 * git commit -m "commit"
 * git remote -v
 * git push -u origin master
 
 Add user credentials for dockerhubregistery and kubernetes in jenkins managed credentials
  * for Dockerhub use username and password
  * for kubernetes use kubeconfig file

 Runing pipeline through jenkins interface
 * Click on add new item
 * Enter item name and select pipeline press ok
 * Go to pipeline section
 * Select Poll SCM under Build triggers
 * Select in definition Pipeline script from SCM  
 * Select Git in SCM
 * Add your github repository
 * Add Jenkinsfile under Script Path
 * Clink apply and then save
 * Clink on Build now and wait for pipeline to trigger
 
 

 
 

 
  
  



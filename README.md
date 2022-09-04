# assignment

# Requirements
*GitHub repository
*Docker repository
*Jenkins
*Docker
*Kubernetes (minikube or K3s)
*Application to be deployed

# Installation 
Minikube or K3s
Docker desktop
Jenkins
wsl

## run
# starting minikube in command prompt
 Minikube start in Cmd
# creating namespace in minikube
 kubectl get namespaces
 kubectl create namepace namespace
 kubectl get namespaces
# Clone the repository to local machine
 git clone (github link)
# Push the image to GitHub repositery
 git status
 git add .
 git commit -m "commit"
 git remote add origin (github link)
 git remote -v
 git push -u origin master
# Jenkins deployment

kubectl create -f jenkinsdeployment.yaml -n namespace

kubectl create -f jenkinsservice.yaml -n namespace
  
  



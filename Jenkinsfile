pipeline {

  environment {
    // environment is set with dockerimagename assigned. This can be updated with valid text within quotes
    dockerimagename = "shivshashya/assignment"
    dockerImage = ""
  }

  agent any

  stages {
  // This stage will allow login to GitHub with valid user credentials
    stage('Checkout Source') {
      steps {
        git 'https://github.com/shivshashyaM/assignment.git' //My public git repository
      }
    }
     
// This stage will be used to build image using docker build command
   stage('Build image') { 
      steps{
        script {
          dockerImage = docker.build dockerimagename  //this is reference to dockerimagename taken from environment
        }
      }
    }
// This stage will push build image to dockerhub repository 
   stage('Pushing Image') {
      environment {
               registryCredential = 'dockerhublogin'  //Login to my docker repository with the credentials specified in Jenkins
           }
      steps{
        script {
          docker.withRegistry( 'https://registry.hub.docker.com', registryCredential ) {   // this will login to dockerhub
            dockerImage.push("latest")  //Pushing the image with the tag latest
          }
        }
      }
    }

    stage('Deploying App to Kubernetes') {   //Deploying the app in Kubernetes 
      steps {
        script {
          kubernetesDeploy(configs: "kubedeployment.yaml", kubeconfigId: "kubernetes")  //.yaml file for deployment. KubeconfigId for login, credentials in Jenkins
        }
      }
    }

  }

}

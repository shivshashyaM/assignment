pipeline {

  environment {
    dockerimagename = "shivshashya/assignment" //Docker image name
    dockerImage = ""
  }

  agent any

  stages {

    stage('Checkout Source') { //Login GitHub
      steps {
        git 'https://github.com/shivshashyaM/assignment.git' //My public git repository
      }
    }
     

   stage('Build image') { //Building image
      steps{
        script {
          dockerImage = docker.build dockerimagename  //Name taken from environment
        }
      }
    }

   stage('Pushing Image') {
      environment {
               registryCredential = 'dockerhublogin'  //Login to my docker repository with the credentials specified in Jenkins
           }
      steps{
        script {
          docker.withRegistry( 'https://registry.hub.docker.com', registryCredential ) {   //Login  Docker registry
            dockerImage.push("latest")  //Pushing the image with the tag latest
          }
        }
      }
    }

    stage('Deploying App to Kubernetes') {   //Deploying the image in Kubernetes 
      steps {
        script {
          kubernetesDeploy(configs: "kubedeployment.yaml", kubeconfigId: "kubernetes")  //Yaml file for deployment. KubeconfigId for login, credentials in Jenkins
        }
      }
    }

  }

}
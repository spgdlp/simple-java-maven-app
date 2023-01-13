pipeline {
    agent any
    tools {
        maven '3.8.7'
    }
    environment{
        DOCKERHUB_CREDENTIALS = credentials('spgdlp-dockerhub')
    }
    stages {
        stage ('Build Maven Project'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/spgdlp/simple-java-maven-app']]])
                bat 'mvn clean install'
            }
        }
        stage ('Build Docker Image'){
            steps{
                script{
                    bat 'docker build -t spgdlp/java-app1 .'
                }

            }
        }
        stage ('Login Docker Registry'){
            steps{
                script{
                    bat 'docker login --username=%DOCKERHUB_CREDENTIALS_USR% --password=%DOCKERHUB_CREDENTIALS_PSW%'
                }
            }
        }
        stage ('Push Docker Image'){
            steps{
                script{
                    //bat 'docker push spgdlp/java-app1:latest'
                    bat 'kubectl get pods -n=jenkins'
                }
            }
        }
        stage ('Deploy to K8S'){
            steps{
                script{
                    bat 'helm'
                }
            }
        }
    }
    post{
        always {
            bat 'docker logout'
        }
    }
}
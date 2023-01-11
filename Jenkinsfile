pipeline {
    agent any
    tools {
        maven '3.8.7'
    }
    stages {
        stage ('Build Maven Project'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/spgdlp/simple-java-maven-app']]])
                bat 'mvn clean install'
            }
        }
    }
}
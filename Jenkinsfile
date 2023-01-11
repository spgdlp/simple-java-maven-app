pipeline {
    agent any
    tools {
        maven 'maven 3_5_0'
    }
    stages {
        stage ('Build Maven Project'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/spgdlp/simple-java-maven-app']]])
                sh 'mvn clean install'
            }
        }
    }
}
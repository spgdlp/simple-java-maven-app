pipeline {
    agent any
    tools {
        maven 'maven_3_8_7'
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
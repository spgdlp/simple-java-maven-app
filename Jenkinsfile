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
                //bat 'mvn clean package sonar:sonar'
            }
        }
        stage ('SonarQube Analisis'){
            steps{
                withSonarQubeEnv('SonarQubePruebas'){
                    bat 'mvn sonar:sonar'
                }
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
                    bat 'docker push spgdlp/java-app1:latest'
                }
            }
        }
        /*stage ('Deploy to K8S'){
            steps {
                kubernetes {
                    cloud 'kubernetes'
                    yaml """
                        apiVersion: apps/v1
                        kind: Deployment
                        metadata:
                        name: java-app1
                        labels:
                            app: java-app1
                        spec:
                        selector:
                            matchLabels:
                            app: java-app1
                        replicas: 2
                        template:
                            metadata:
                            labels:
                                app: java-app1
                            spec:
                            containers:
                                - name: java-app1
                                image: spgdlp/java-app1
                                imagePullPolicy: IfNotPresent
                                ports:
                                    - containerPort: 8080

                        ---
                        apiVersion: v1
                        kind: Service
                        metadata:
                        name: java-app1-svc
                        spec:
                        selector:
                            app: java-app1
                        ports:
                            - protocol: TCP
                            #Puerto del servicio
                            port: 8080
                            #Puerto del POD
                            targetPort: 8080
                        type: NodePort
                    """
                }
            }
            steps {
                bat 'echo Hola'
            }
        }*/
    }
    post{
        always {
            bat 'docker logout'
        }
    }
}
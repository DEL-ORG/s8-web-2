pipeline {
    agent any
    parameters {
        string(name: 'BRANCH_NAME', defaultValue: 's8armand2', description: '')
        string(name: 'IMAGE_NAME', defaultValue: 'armand', description: '')
        string(name: 'CONTAINER_NAME', defaultValue: 'armando', description: '')
        string(name: 'PORT_ON_DOCKER_HOST', defaultValue: '29', description: '')
    }
    stages {
        stage('Clone Repository') {
            steps {
                script {
                    git credentialsId: 'jenkins-ssh-agents-private-key',
                        url: 'git@github.com:DEL-ORG/s8-web-2.git',
                        branch: "${params.BRANCH_NAME}"
                }
            }
        }
        stage('Checking the code') {
            steps {
                script {
                    sh """
                        ls -l
                    """ 
                }
            }
        }
        stage('Building the dockerfile') {
            steps {
                script {
                    sh """
                        docker build -t ${params.IMAGE_NAME} .
                        docker images |grep ${params.IMAGE_NAME}
                    """ 
                }
            }
        }
        stage('Deploying the application') {
            steps {
                script {
                    sh """
                        docker run -itd -p ${params.PORT_ON_DOCKER_HOST}:80 --name ${params.CONTAINER_NAME} ${params.IMAGE_NAME} || true
                        docker ps |grep ${params.CONTAINER_NAME}
                    """ 
                }
            }
        }
    }
}
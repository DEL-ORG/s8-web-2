pipeline {
    agent any
    environment {
        DOCKER_HUB_USERNAME="omobaabiola"
        ALPHA_APPLICATION_01_REPO="alpha-application-01"
        ALPHA_APPLICATION_02_REPO="alpha-application-02"
    }
    parameters {
        string(name: 'BRANCH_NAME', defaultValue: 's8abiola1', description: '')
        string(name: 'APP1_TAG', defaultValue: 'app1.1.1.0', description: '')
        string(name: 'APP2_TAG', defaultValue: 'app2.1.1.0', description: '')
        string(name: 'PORT_ON_DOCKER_HOST', defaultValue: '', description: '')
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
        stage('Building application 01') {
            steps {
                script {
                    sh """
                        docker build -t ${env.DOCKER_HUB_USERNAME}/${env.ALPHA_APPLICATION_01_REPO}:${params.APP1_TAG} .
                        docker images |grep ${params.APP1_TAG}
                    """ 
                }
            }
        }
        stage('Building application 02') {
            steps {
                script {
                    sh """
                        docker build -t "${env.DOCKER_HUB_USERNAME}"/"${env.ALPHA_APPLICATION_02_REPO}":"${params.APP2_TAG}" -f application-02.Dockerfile .
                        docker images |grep ${params.APP2_TAG}
                    """ 
                }
            }
        }
        // stage('Deploying the application') {
        //     steps {
        //         script {
        //             sh """
        //                 docker run -itd -p ${params.PORT_ON_DOCKER_HOST}:80 --name ${params.CONTAINER_NAME} ${params.IMAGE_NAME}-application-02
        //                 docker ps |grep ${params.CONTAINER_NAME}
        //             """ 
        //         }
        //     }
        // }
    }
}
pipeline {
    agent any
    environment {
        DOCKER_HUB_USERNAME="devopseasylearning"
        ALPHA_APPLICATION_01_REPO="alpha-application-01"
        ALPHA_APPLICATION_02_REPO="alpha-application-02"
        DOCKER_CREDENTIAL_ID = 'del-docker-hub-auth'
    }
    parameters {
        string(name: 'BRANCH_NAME', defaultValue: 's8marjorie', description: '')
        string(name: 'APP1_TAG', defaultValue: 'app1.1.1.0', description: '')
        string(name: 'APP2_TAG', defaultValue: 'app2.1.1.0', description: '')
        string(name: 'PORT_ON_DOCKER_HOST', defaultValue: '', description: '')
        string(name: 'PUSH_USER_NAME', defaultValue: 's8mike', description: '')
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
        stage('Login into') {
            steps {
                script {
                    // Login to Docker Hub
                    withCredentials([usernamePassword(credentialsId: DOCKER_CREDENTIAL_ID, usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        // Use Docker CLI to login
                        sh "docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD"
                    }
                }
            }
        }
        stage('Pushing application 01 into DockerHub') {
            steps {
                script {
                    sh """
                        docker push ${env.DOCKER_HUB_USERNAME}/${env.ALPHA_APPLICATION_01_REPO}:${params.APP1_TAG}
                    """
                }
            }
        }
        stage('Pushing application 02 into DockerHub') {
            steps {
                script {
                    sh """
                        docker push ${env.DOCKER_HUB_USERNAME}/${env.ALPHA_APPLICATION_02_REPO}:${params.APP2_TAG}
                    """
                }
            }
        }
        stage('Login into s8mike DockerHub') {
            steps {
                script {
                    sh """
                        docker login -u s8mike -p dckr_pat_wlcMY9nOyXFSI3R11E2Hs99IsJo
                    """
                }
            }
        }
        stage('Pushing into s8mike DockerHub') {
            steps {
                script {
                    sh """
                        docker tag ${env.DOCKER_HUB_USERNAME}/${env.ALPHA_APPLICATION_01_REPO}:${params.APP1_TAG} ${params.PUSH_USER_NAME}/${env.ALPHA_APPLICATION_01_REPO}:${params.APP1_TAG}

                        docker tag ${env.DOCKER_HUB_USERNAME}/${env.ALPHA_APPLICATION_02_REPO}:${params.APP2_TAG} ${params.PUSH_USER_NAME}/${env.ALPHA_APPLICATION_02_REPO}:${params.APP2_TAG}

                        docker push ${params.PUSH_USER_NAME}/${env.ALPHA_APPLICATION_01_REPO}:${params.APP1_TAG}
                        docker push ${params.PUSH_USER_NAME}/${env.ALPHA_APPLICATION_02_REPO}:${params.APP2_TAG}
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
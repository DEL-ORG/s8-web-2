pipeline {
    agent any
    triggers {
        githubPush()
    }
    options {
        timeout(time: 20, unit: 'MINUTES') // Timeout for the entire pipeline
        buildDiscarder(logRotator(numToKeepStr: '5')) // Discard old builds to save disk space
        disableConcurrentBuilds() // Ensures that only one build can run at a time
        timestamps() // Adds timestamps to the console output
        skipDefaultCheckout() // Skips the default checkout of source code, useful if you're doing a custom checkout
        retry(2) // Automatically retries the entire pipeline up to 3 times if it fails
    }
    environment {
        DOCKER_HUB_USERNAME="devopseasylearning"
        DOCKER_HUB_USERNAME_ARMAND="romaricmba"
        APPLI_01_REPO="app-01"
        APPLI_02_REPO="app-02"
        DOCKER_CREDENTIAL_ID = 's8-test-docker-hub-auth'
    }
    parameters {
        string(name: 'BRANCH_NAME', defaultValue: 's8armand2', description: '')
        string(name: 'APP_TAG', defaultValue: 's8armand', description: '')
        string(name: 'PORT_ON_DOCKER_HOST', defaultValue: '290', description: '')
    }
    stages {
        stage ('Check Allow Users') {
            steps {
                script {
                    wrap([$class: 'BuildUser']) {
                        def build_id = env.BUILD_USER_ID
                        def build_user = env.BUILD_USER
                        echo "build_id : $build_id"
                        if (build_id in ['s8armand', 'admin']) {
                            echo "Hi $build_user, You are allowed to run this job"
                        } else {
                            error "Hi $build_user, You are not allowed to run this job"
                        }
                    }
                }
            }
        }
        stage('Sanity Check') {
            steps {
                script {
                    sanity_check()
                }
            }
        }
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
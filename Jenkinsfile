pipeline {
    agent any

    enviroment {
        // DOCKER_HUB_USERNAME = "ericyan23"
        // DOCKER_HUB_PASSWD = "dckr_pat_2YYct3sQSHTBtwykEvl1ZghtkxU"

        DOCKER_HUB_USERNAME = "devopseasylearning"
        DOCKER_HUB_CREDENTIAL_ID = "del-docker-hub-auth"

        APP_01_REPO = "s8giang-application-01"
        APP_02_REPO = "s8giang-application-02"
    }

    options {
        timeout(time: 1, unit: 'HOURS') // Set timeout for the entire pipeline
        timestamps() // Add timestamps to the console output
    }

    parameters {
        string(name: 'BRANCH_NAME', defaultValue: 's8giang_app_push', description: '')
        string(name: 'APP1_TAG', defaultValue: 'app1.1.1.0', description: '')
        string(name: 'APP2_TAG', defaultValue: 'app2.1.1.0', description: '')
        // string(name: 'PORT_ON_DOCKER_HOST', defaultValue: '', description: '')
    }

    stages {
        stage('Clone Repository and check') {
            steps {
                script {
                    git credentialsId: 'jenkins-ssh-agents-private-key',
                        url: 'git@github.com:DEL-ORG/s8-web-2.git',
                        branch: "${params.BRANCH_NAME}"
                }

                script {
                    sh """
                        ls -l
                    """ 
                }
            }
        }
        

        stage('Building application 01 and 02') {
            steps {
                script { // set up image names 
                    sh """
                        IMAGE_NAME_app01 = ${env.DOCKER_HUB_USERNAME}/${env.APP_01_REPO}:${params.APP1_TAG}
                        IMAGE_NAME_app02 = ${env.DOCKER_HUB_USERNAME}/${env.APP_02_REPO}:${params.APP2_TAG}
                    """
                }


                script { // build images and check
                    sh """
                        docker build -t ${IMAGE_NAME_app01} -f Dockerfile_app01 . || true   
                        docker build -t ${IMAGE_NAME_app02} -f Dockerfile_app02 . || true

                        docker images | grep ${IMAGE_NAME_app01}
                        docker images | grep ${IMAGE_NAME_app02}
                    """ 
                }
            }
        }
        
        stage('log into docker hub and push') {
            steps {
                script { // Login to Docker Hub
                    withCredentials([usernamePassword(credentialsId: DOCKER_CREDENTIAL_ID, usernameVariable: 'DOCKER_HUB_USERNAME', passwordVariable: 'DOCKER_HUB_PASSWD')]) {
                        // In this step, we extract "DOCKER_HUB_USERNAME" and "DOCKER_HUB_PASSWD" from docker hub credential "DOCKER_CREDENTIAL_ID"
                        // Use Docker CLI to login
                        sh "docker login -u $DOCKER_HUB_USERNAME -p $DOCKER_HUB_PASSWD"
                    }
                }

                script { // push to Docker hub
                    sh """
                        docker push $IMAGE_NAME_app01
                        docker push $IMAGE_NAME_app02
                    """

                }
            }
        }        
    }

    // -----------------  connect to slack to get notification that the pipeline runs successfully or not ---------------------------
    post {
        success {
            slackSend color: '#2EB67D',
            channel: 's8-session-jenkins-alerts', 
            message: "*SESSION 08 PROJECT*" +
            "\n Project Name: Revive" +
            "\n Job Name: ${env.JOB_NAME}" +
            "\n Build number: ${currentBuild.displayName}" +
            "\n Build Status : *SUCCESS*" +
            "\n Build url : ${env.BUILD_URL}"
        }
        failure {
            slackSend color: '#E01E5A',
            channel: 's8-session-jenkins-alerts',  
            message: "*SESSION 08 PROJECT*" +
            "\n Project Name: Revive" +
            "\n Job Name: ${env.JOB_NAME}" +
            "\n Build number: ${currentBuild.displayName}" +
            "\n Build Status : *FAILED*" +
            "\n Action : Please check the console output to fix this job IMMEDIATELY" +
            "\n Build url : ${env.BUILD_URL}"
        }
        unstable {
            slackSend color: '#ECB22E',
            channel: 's8-session-jenkins-alerts', 
            message: "*SESSION 08 PROJECT*" +
            "\n Project Name: Revive" +
            "\n Job Name: ${env.JOB_NAME}" +
            "\n Build number: ${currentBuild.displayName}" +
            "\n Build Status : *UNSTABLE*" +
            "\n Action : Please check the console output to fix this job IMMEDIATELY" +
            "\n Build url : ${env.BUILD_URL}"
        }   
    }

}
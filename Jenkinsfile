pipeline {
    agent any
    parameters {
        string(name: 'BRANCH_NAME', defaultValue: 's8tia', description: '')
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
        stage('Create a dir to deploy the code') {
            steps {
                script {
                    sh """
                        ls -l
                    """ 
                }
            }
        }
    }
}
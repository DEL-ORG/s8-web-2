pipeline {
    agent any
    parameters {
        string(name: 'BRANCH_NAME', defaultValue: 's8giang', description: '')
        string(name: 'IMAGE_NAME', defaultValue: 'ubuntu', description: '')
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
                        pwd
                        ls -a
                        docker build -t ${params.IMAGE_NAME}:my_ubuntu .
                        docker images | grep ${params.IMAGE_NAME}
                        echo "The following is in container"
                        docker run ${params.IMAGE_NAME}:my_ubuntu bash -c 'pwd; ls -a'
                    """ 
                }
            }
        }

        
    }
}
pipeline {
    agent { label 'SERVER04' }
    parameters {
        string(name: 'BRANCH_NAME', defaultValue: 's8akpos', description: '')
    }
    stages {
        stage('Clone Repository') {
            steps {
                script {
                    // Clone the repository using SSH with private key and checkout the specific branch
                    git credentialsId: 'jenkins-ssh-agents-private-key',
                        url: 'git@github.com:DEL-ORG/s8-web-2.git',
                        branch: "${params.BRANCH_NAME}"
                }
            }
        }
        // stage('Install Apache') {
        //     steps {
        //         script {
        //             sh """
        //                 sudo apt update
        //                 sudo apt install apache2 -y
        //                 sudo systemctl start apache2
        //                 sudo systemctl status apache2
        //                 sudo systemctl enable apache2
        //             """
        //         }
        //     }
        // }
        stage('Create a dir to deploy the code') {
            steps {
                script {
                    sh """
                        cd /var/www/html
                        sudo mkdir s8akpos
                    """ 
                }
            }
        }
        // stage('Deploying the Code') {
        //     steps {
        //         script {
        //             sh """
        //                 pwd
        //                 ls -l
        //                 sudo cp -r * /var/www/html
        //             """ 
        //         }
        //     }
        // }
    }
}
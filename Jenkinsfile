pipeline {
<<<<<<< HEAD
    agent { label 'SERVER04' }
    parameters {
        string(name: 'BRANCH_NAME', defaultValue: 's8kevinaf02', description: '')
=======
    agent any
    environment {
        DOCKER_HUB_USERNAME="devopseasylearning"
        ALPHA_APPLICATION_01_REPO="alpha-application-01"
        ALPHA_APPLICATION_02_REPO="alpha-application-02"
        DOCKER_CREDENTIAL_ID = 's8-test-docker-hub-auth'
    }
    parameters {
        string(name: 'BRANCH_NAME', defaultValue: 's8tia', description: '')
        string(name: 'APP1_TAG', defaultValue: 'latest', description: '')
        string(name: 'APP2_TAG', defaultValue: 'latest', description: '')
        string(name: 'PORT_ON_DOCKER_HOST', defaultValue: '', description: '')
>>>>>>> 4242de18cc74241f7b260b2abfd8e98770fcc6e3
    }
    stages {
        stage('Clone Repository') {
            steps {
                script {
<<<<<<< HEAD
                    // Clone the repository using SSH with private key and checkout the specific branch
=======
>>>>>>> 4242de18cc74241f7b260b2abfd8e98770fcc6e3
                    git credentialsId: 'jenkins-ssh-agents-private-key',
                        url: 'git@github.com:DEL-ORG/s8-web-2.git',
                        branch: "${params.BRANCH_NAME}"
                }
            }
        }
<<<<<<< HEAD
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
                        sudo mkdir -p s8kevinaf02/cicd-pipeline/tech-software-web || true
=======
        stage('Checking the code') {
            steps {
                script {
                    sh """
                        ls -l
>>>>>>> 4242de18cc74241f7b260b2abfd8e98770fcc6e3
                    """ 
                }
            }
        }
<<<<<<< HEAD
        stage('Deploying the Code') {
=======
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
>>>>>>> 4242de18cc74241f7b260b2abfd8e98770fcc6e3
            steps {
                script {
                    sh """
                        pwd
                        ls -l
<<<<<<< HEAD
                        sudo cp -r * /var/www/html/s8kevinaf02/cicd-pipeline/tech-software-web
=======
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
                    withCredentials([usernamePassword(credentialsId: "s8-test-docker-hub-auth", 
                    usernameVariable: 'DOCKER_USERNAME', 
                    passwordVariable: 'DOCKER_PASSWORD')]) {
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
        // stage('Login into s8marjorie DockerHub') {
        //     steps {
        //         script {
        //             sh """
        //                 docker login -u thedevopslady -p dckr_pat_D_lEO8hxlSoof91Wn5BRnza2S8Q
        //             """
        //         }
        //     }
        // }
        // stage('Pushing into s8marjorie DockerHub') {
        //     steps {
        //         script {
        //             sh """
        //                 docker tag devopseasylearning/alpha-application-01:app1.1.1.0 thedevopslady/alpha-application-01:app1.1.1.0

        //                 docker tag devopseasylearning/alpha-application-02:app2.1.1.0 thedevopslady/alpha-application-02:app2.1.1.0

        //                 docker push thedevopslady/alpha-application-01:app1.1.1.0
        //                 docker push thedevopslady/alpha-application-02:app2.1.1.0
        //             """
        //         }
        //     }
        // }
        stage('Deploying the application') {
            steps {
                script {
                    sh """
                        docker run -itd -p ${params.PORT_ON_DOCKER_HOST}:80 --name ${params.CONTAINER_NAME} ${params.IMAGE_NAME}-application-02
                        docker ps |grep ${params.CONTAINER_NAME}
>>>>>>> 4242de18cc74241f7b260b2abfd8e98770fcc6e3
                    """ 
                }
            }
        }
    }
<<<<<<< HEAD
}
=======
}
>>>>>>> 4242de18cc74241f7b260b2abfd8e98770fcc6e3

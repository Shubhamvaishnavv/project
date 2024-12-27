pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "your-dockerhub-username/hello-world"
        DOCKER_TAG = "latest"
        KUBECONFIG_CRED = "kubeconfig-credential-id"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} .'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    sh 'docker push ${DOCKER_IMAGE}:${DOCKER_TAG}'
                }
            }
        }

        stage('Helm Deployment') {
            steps {
                script {
                    withCredentials([kubeconfigFile(credentialsId: KUBECONFIG_CRED, variable: 'KUBECONFIG')]) {
                        sh "helm upgrade --install hello-world ./hello-world-helm-chart --set image.repository=${DOCKER_IMAGE} --set image.tag=${DOCKER_TAG}"
                    }
                }
            }
        }
    }
}

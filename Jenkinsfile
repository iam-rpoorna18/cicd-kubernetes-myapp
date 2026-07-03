pipeline {
    agent any
    
    //{ label 'host' }

    environment {
        IMAGE = "myapp:latest"
    }

    stages {
        stage('Test') {
            steps {
                sh 'whoami'
                sh 'docker version'
                sh 'kind version'
            }
        }
        stage('Clone') {
            steps {
                //git 'https://github.com/poorna138/cicd-kubernetes.git'
                git branch: 'main', 
                credentialsId: 'github-token',
                url: 'https://github.com/iam-rpoorna18/cicd-kubernetes-myapp.git'
            }
        }
        stage('Test Docker') {
            steps {
                sh 'docker version'
                sh 'docker ps'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t $IMAGE .'
                }
            }
        }

        stage('Load Image into Kind') {
            steps {
                sh 'kind load docker-image $IMAGE'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f k8s/deployment.yaml'
                sh 'kubectl apply -f k8s/service.yaml'
                sh 'kubectl apply -f k8s/ingress.yaml'
            }
        }

        stage('Verify') {
            steps {
                sh 'kubectl get pods'
                sh 'kubectl get svc'
                sh 'kubectl get ingress'
            }
        }
    }
}

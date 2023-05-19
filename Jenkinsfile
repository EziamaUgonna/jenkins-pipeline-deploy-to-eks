pipeline {
    agent any
    environment {
        aws_access_key_id= credentials('aws_access_key_id')
        aws_secret_access_key = credentials('aws_secret_access_key')
        AWS_DEFAULT_REGION = "us-east-1"
    }
    stages {
        stage("Create an EKS Cluster") {
            steps {
                script {
                    sh "cd terraform"
                    sh "terraform init"
                    sh "terraform apply -auto-approve"
                }
            }
        }
        stage("Deploy to EKS") {
            steps {
                script {
                    sh "cd kubernetes"
                    sh "aws eks update-kubeconfig --name myapp-eks-cluster"
                    sh "kubectl apply -f nginx-deployment.yaml"
                    sh "kubectl apply -f nginx-service.yaml"
                }
            }
        }
    }
}

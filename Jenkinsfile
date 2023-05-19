pipeline {
    agent any
    environment {
        AWS_DEFAULT_REGION = "us-east-1"
    }
    stages {
        stage("Create an EKS Cluster") {
            steps {
                withCredentials([
                    string(credentialsId: 'aws_access_key_id', variable: 'AWS_ACCESS_KEY_ID'),
                    string(credentialsId: 'aws_secret_access_key', variable: 'AWS_SECRET_ACCESS_KEY')
                ]) {
                    sh "cd terraform"
                    sh "terraform init"
                    sh "terraform apply -auto-approve"
                }
            }
        }
        stage("Deploy to EKS") {
            steps {
                withCredentials([
                    string(credentialsId: 'aws_access_key_id', variable: 'AWS_ACCESS_KEY_ID'),
                    string(credentialsId: 'aws_secret_access_key', variable: 'AWS_SECRET_ACCESS_KEY')
                ]) {
                    sh "cd kubernetes"
                    sh "aws eks update-kubeconfig --name myapp-eks-cluster"
                    sh "kubectl apply -f nginx-deployment.yaml"
                    sh "kubectl apply -f nginx-service.yaml"
                }
            }
        }
    }
}

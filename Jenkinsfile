pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout code from GitHub repository
                git 'https://github.com/aditya-sridhar/simple-reactjs-app.git'
            }
        }
        
        stage('Dependency Installation') {
            steps {
                // Install dependencies for the frontend
                sh 'npm install'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                // Build Docker image
                sh 'docker build -t your_dockerhub_username/simple-reactjs-app .'
            }
        }
        
        stage('Run Docker Image') {
            steps {
                // Run Docker image
                sh 'docker run -d -p 8080:80 your_dockerhub_username/simple-reactjs-app'
            }
        }
        
        stage('Push Docker Image') {
            steps {
                // Push Docker image to Docker Hub
                sh 'docker push your_dockerhub_username/simple-reactjs-app'
            }
        }
    }
    
    post {
        success {
            echo 'Pipeline executed successfully!'
        }
        failure {
            echo 'Pipeline execution failed!'
        }
    }
}

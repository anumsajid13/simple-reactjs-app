pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout code from GitHub repository
                git 'https://github.com/anumsajid13/simple-reactjs-app.git'
            }
        }
        
        stage('Dependency Installation') {
            steps {
                // Install dependencies for the frontend
                bat 'npm install'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                // Build Docker image
                bat 'docker build -t anumsajid/simple-reactjs-app .'
            }
        }
        
        stage('Run Docker Image') {
            steps {
                // Run Docker image
                bat 'docker run -d -p 8080:80 anumsajid/simple-reactjs-app'
            }
        }
        
        stage('Push Docker Image') {
            steps {
                // Push Docker image to Docker Hub
                withCredentials([usernamePassword(credentialsId: '8edf9ffe-fb4c-4b41-add0-63caa4007737')]) {
                    bat 'docker push anumsajid/simple-reactjs-app'
                }
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

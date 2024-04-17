pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                
                bat git branch:'main' ,url: 'https://github.com/anumsajid13/simple-reactjs-app.git'
            }
        }
        
        stage('Dependency Installation') {
            steps {
            
                bat 'npm install'
            }
        }
        
        stage('Build Docker Image') {
            steps {
        
                bat 'docker build -t anumsajid/simple-reactjs-app .'
            }
        }
        
        stage('Run Docker Image') {
            steps {
            
                bat 'docker run -d -p 8080:80 anumsajid/simple-reactjs-app'
            }
        }
        
        stage('Push Docker Image') {
            steps {
               
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

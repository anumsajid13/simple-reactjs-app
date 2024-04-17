pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                
                git branch:'main' ,url: 'https://github.com/anumsajid13/simple-reactjs-app.git'
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
            
                bat 'docker run -d -p 3000:3000 anumsajid/simple-reactjs-app'
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

pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                echo 'Checking out source code...'
                checkout scm
            }
        }

        stage('Build Backend Docker Image') {
            steps {
                echo 'Building backend Docker image...'
                sh 'docker build -t techpathway-backend ./backend'
            }
        }

        stage('Build Frontend Docker Image') {
            steps {
                echo 'Building frontend Docker image...'
                sh 'docker build -t techpathway-frontend ./frontend'
            }
        }

       stage('Test Frontend Build') {
    steps {
        echo 'Testing frontend production build...'
        sh 'docker run --rm techpathway-frontend node ./node_modules/react-scripts/bin/react-scripts.js build'
    }
}
        stage('Verify Docker Images') {
            steps {
                echo 'Verifying Docker images...'
                sh 'docker images | grep techpathway'
            }
        }
    }

    post {
        success {
            echo 'CI pipeline completed successfully!'
        }

        failure {
            echo 'CI pipeline failed. Check the Jenkins console output.'
        }
    }
}
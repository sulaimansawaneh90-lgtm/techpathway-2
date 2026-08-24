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

        stage('Deploy Application') {
            steps {
                echo 'Deploying application...'

                sh '''
                    docker stop techpathway-backend || true
                    docker rm techpathway-backend || true

                    docker run -d \
                        --name techpathway-backend \
                        -p 5000:5000 \
                        techpathway-backend

                    docker stop techpathway-frontend || true
                    docker rm techpathway-frontend || true

                    docker run -d \
                        --name techpathway-frontend \
                        -p 3000:3000 \
                        techpathway-frontend

                    docker ps
                '''
            }
        }
    }

    post {
        success {
            echo 'CI/CD pipeline completed successfully!'
        }

        failure {
            echo 'CI/CD pipeline failed. Check the Jenkins console output.'
        }
    }
}
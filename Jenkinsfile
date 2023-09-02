pipeline {
    agent any

    stages {
        stage('Run') {
            steps {
                script {
                    // Start the container using Docker Compose
                    def buildResult = sh(returnStatus: true, script: "./build.sh")
                    if (buildResult == 0) {
                        echo "Build successful!"
                    } else {
                        error "Build failed!"
                    }
                }
            }
        }
    }
}


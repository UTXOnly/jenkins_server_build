pipeline {
    agent any

    stages {
        stage('Run') {
            steps {
                script {
                    //jenkisn_test
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


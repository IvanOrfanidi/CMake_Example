pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                sh 'bash compile.sh'
            }
        }

        stage('archive') {
            steps {
                sh 'zip build/cmake.zip build/main.exe build/main'
            }
        }

        stage('artifacts') {
            steps {
                archiveArtifacts artifacts: 'build/cmake_example.zip', onlyIfSuccessful: true
            }
        }

        stage('clean') {
            steps {
                cleanWs()
            }
        }
    }
    options {
        buildDiscarder(logRotator(numToKeepStr: '1'))
    }
}

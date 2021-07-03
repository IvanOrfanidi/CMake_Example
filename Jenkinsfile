// Name of the executable file
def EXECUTABLE_FILE_NAME = "cmake_example"

pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                sh """
                    rm -rf build
                    mkdir build
                    cd build
                    cmake -G "Unix Makefiles" -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DCMAKE_BUILD_TYPE=Release ..
                    cmake --build .
                    strip ${EXECUTABLE_FILE_NAME}
                """
            }
        }

        stage('cppcheck') {
            steps {
                sh 'cppcheck --language=c++ -Iinclude --enable=all --xml --xml-version=2 -i ext  source 2> build/cppcheck.xml'
                sh 'cppcheck-htmlreport --source-encoding="iso8859-1" --title="project" --source-dir=. --report-dir=build --file=build/cppcheck.xml'
                publishHTML(
                    target: [
                      allowMissing: true,
                      alwaysLinkToLastBuild: false,
                      keepAll: false,
                      reportDir: 'build',
                      reportFiles: 'index.html',
                      reportName: 'CppCheck Report',
                      reportTitles: ''
                    ]
                )
            }
        }

        stage('archive') {
            steps {
                sh "zip build/${EXECUTABLE_FILE_NAME}.zip build/${EXECUTABLE_FILE_NAME}.exe build/${EXECUTABLE_FILE_NAME}"
            }
        }

        stage('artifacts') {
            steps {
                archiveArtifacts artifacts: "build/${EXECUTABLE_FILE_NAME}.zip", onlyIfSuccessful: true
            }
        }

        stage('clean') {
            steps {
                cleanWs()
            }
        }
    }
}

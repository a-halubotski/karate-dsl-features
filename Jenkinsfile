pipeline {
    agent {
        label 'master'
    }

    stages {
        stage('Execute') {
            agent {
                docker {
                    image 'docker.teqniksoft.com:5000/karate-dsl-ci:latest'
                    label 'karate-dsl-ci-test' // to environment
                    reuseNode true
                    args "--env-file=$(pwd)/dev.env -v $(pwd)/features:/var/app/karate/src/test/java/features"
                }
            }

            steps {
                echo 'Do something here'
            }
/*
            script {
                docker.withRegistry('https://docker.teqniksoft.com:5000') {
                    def image = docker.image('docker.teqniksoft.com:5000/karate-dsl-ci:latest');
                }
            }
*/
        }
    }

}
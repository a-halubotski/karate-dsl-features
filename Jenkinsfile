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
                    args '--env-file=dev.env -v $(pwd)/features:/var/app/karate/src/test/java/features'
                }
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
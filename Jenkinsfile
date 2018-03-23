pipeline {
    agent {
        label 'master'
    }

    stages {
        stage('Execute') {
/*            agent {
                docker {
                    image 'docker.teqniksoft.com:5000/karate-dsl-ci:latest'
                    label 'karate-dsl-ci-test' // to environment
                    reuseNode true
                    args "--env-file=$(pwd)/dev.env -v $(pwd)/features:/var/app/karate/src/test/java/features"
                }
            }
*/
            steps {
                script {
                    docker.withRegistry('https://docker.teqniksoft.com:5000') {
                        def image = docker.image('docker.teqniksoft.com:5000/karate-dsl-ci:latest');
                        image.run('--env-file=dev.env -v $(pwd)/features:/var/app/karate/src/test/java/features -v /var/lib/jenkins/workspace/.m2:/root/.m2 -v $(pwd)/target:/var/app/karate/target')

                        sh 'pwd; ls -la target'
                    }
                }
            }
        }
    }

}
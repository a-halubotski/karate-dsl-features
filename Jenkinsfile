pipeline {
    agent {
        label 'master'
    }

    stages {
        stage('Execute test') {
            steps {
                script {
                    docker.withRegistry('https://docker.teqniksoft.com:5000') {
                        def image = docker.image('docker.teqniksoft.com:5000/karate-dsl-ci:latest');
                        def container = image.run('--env-file=dev.env -v $(pwd)/features:/var/app/karate/src/test/java/features -v /var/lib/jenkins/workspace/.m2:/root/.m2 -v $(pwd)/target:/var/app/karate/target')
                        CID = container.id
                        sh "docker wait ${CID}"
                    }
                }
            }
        }
        stage('Verify & Report') {
            steps {
                junit keepLongStdio: true, testResults: 'target/surefire-reports/*.xml'

                publishHTML (target: [
                    allowMissing: false,
                    alwaysLinkToLastBuild: false,
                    keepAll: true,
                    reportDir: 'target/surefire-reports',
                    reportFiles: 'TEST*.html',
                    reportName: "Karate report"
                ])
            }
        }
        stage('Variable') {
            steps {
                echo DOCKER_LOGS_DEBUG
                echo env.DOCKER_LOGS_DEBUG
            }
        }
    }
}
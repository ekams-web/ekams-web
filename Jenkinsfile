// This is Jenkins syntax pipeline
pipeline {
    agent {
        label 'master'
    }
    stages {
        stage("Git-Clone") {
            steps {
                git branch: 'dev', credentialsId: 'github_creds', url: 'git@github.com:ekams-web/ekams-web.git'
            }
        }
        stage("Clean-PreviousPkgs") {
            steps {
                sh "mvn clean"
            }
        }
        stage("Compile") {
            steps {
                sh "mvn compile"
            }
        }
        stage("Package") {
            steps {
                sh "mvn package"
            }
        }
    }
}

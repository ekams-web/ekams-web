pipeline {
    agent {
        label 'master'
    }
    stages {
        stage("Git-Clone") {
            steps {
                git branch: 'dev', git credentialsId: 'github_creds', url: 'git@github.com:ekams-web/ekams-web.git'
            }
        }
        stage("Clean-PreviousPkgs") {
            steps {
                sh "mvn clean"
            }
        }
        stage("Code-Compile") {
            steps {
                sh "mvn compile"
            }
        }
        stage("package") {
            steps {
                sh "mvn package"
            }
        }
    }
}

// This is Jenkins pipeline syntax
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
    post {
        always {
            sshPublisher(publishers: [sshPublisherDesc(configName: 'docker_controller', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '//home/docadm/docker/war', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '**/*.war')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
        }
    }
}

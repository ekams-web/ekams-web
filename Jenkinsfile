/* 
Description : Jenkins Build Pipeline
Created by : Aravind Machha
Date of creation : 14-AUG-2021
Date of last modification : 15-AUG-2021
*/
pipeline {
    agent {
        label 'master'
    }
    stages {
        stage("Git-Clone") {
            steps {
                git branch: 'dev', url: 'https://github.com/ekams-web/ekams-web.git'
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
        stage("Test") {
            steps {
                sh "mvn test"
            }
        }
        stage("Package") {
            steps {
                sh "mvn package"
            }
        }
    }
    post {
        success {
            junit allowEmptyResults: true, testResults: '**/target/junit-tests/*.xml'
            sshPublisher(publishers: [sshPublisherDesc(configName: 'docker_controller', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '//opt/docker/efs/war', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '**/*.war')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
            sshPublisher(publishers: [sshPublisherDesc(configName: 'docker_controller', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '//opt/docker/compose', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '**/docker-compose.yaml')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
            sshPublisher(publishers: [sshPublisherDesc(configName: 'ansible_controller', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '/home/ec2-user/ekams', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '**/tomcat_setup.yaml')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
        }
    }
}

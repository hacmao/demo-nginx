#!/usr/bin/env groovy 
def MYVAR

def outputOf(cmd) { return sh(returnStdout:true,script:cmd).trim(); }

pipeline {
  environment {
    GIT_CRE = credentials("Github Hacmao")
  }
  agent {
    kubernetes {
      inheritFrom "default git"
      idleMinutes 5
      defaultContainer "docker"
    }
  }
  stages {
    stage('Test2') {
      sh 'pwd'
      sh 'ls'
    }
    stage('Checkout') {
      steps {
//         git branch: 'main', credentialsId: 'Github Hacmao', url: 'https://github.com/hacmao/2048'
       
        container("git") {
          dir("2048") {
            withCredentials([gitUsernamePassword(credentialsId: 'Github Hacmao', gitToolName: 'Default')]) {
              git branch: 'main', url: 'https://github.com/hacmao/2048'
              sh "git status"
              sh "git checkout -b feature/test2"
              sh 'echo "test PR2" > test2'
              sh 'git add .'
              sh 'git commit -m "Test PR2"'
              sh 'git push --set-upstream origin feature/test2'
            }
            httpRequest acceptType: 'APPLICATION_JSON', 
              authentication: 'Github Hacmao', 
              contentType: 'APPLICATION_JSON', 
              customHeaders: [[maskValue: false, name: 'X-GitHub-Api-Version', value: '2022-11-28']], 
              httpMode: 'POST', 
              requestBody: '{"title":"Test pr 2","body":"Test PR 2","head":"feature/test2","base":"main"}', 
              responseHandle: 'NONE', 
              url: 'https://api.github.com/repos/hacmao/2048/pulls', 
              wrapAsMultipart: false
          }
        }
      }
    }
    stage('Build') {
      steps {
        sh 'ls'
        sh 'echo "Hello world"'
        script {
          MYVAR = outputOf('echo do_something')
          sh "echo MYVAR has been set to: '${MYVAR}'"
        }
      }
    }
    
    stage ('Test') {
      steps {
        sh "echo MYVAR has been set to: '${MYVAR}'"
      }
    }

  }
}

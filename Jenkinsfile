#!/usr/bin/env groovy 
def MYVAR

def outputOf(cmd) { return sh(returnStdout:true,script:cmd).trim(); }

pipeline {
  agent {
    kubernetes {
      inheritFrom "default"
      idleMinutes 5
      defaultContainer "docker"
    }
  }
  stages {
    stage('Checkout') {
      steps {
        git branch: 'main', credentialsId: 'Github Hacmao', url: 'https://github.com/hacmao/2048'
        httpRequest acceptType: 'APPLICATION_JSON', 
          authentication: 'Github Hacmao', 
          contentType: 'APPLICATION_JSON', 
          customHeaders: [[maskValue: false, name: 'X-GitHub-Api-Version', value: '2022-11-28']], 
          httpMode: 'POST', 
          requestBody: '{"title":"Amazing new feature","body":"Please pull these awesome changes in!","head":"feature/test","base":"main"}', 
          responseHandle: 'NONE', 
          url: 'https://api.github.com/repos/hacmao/2048/pulls', 
          wrapAsMultipart: false
      }
    }
    stage('Build') {
      steps {
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

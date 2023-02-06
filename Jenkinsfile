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
        ls
        pwd
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

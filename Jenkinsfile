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
    stage('Build') {
      steps {
        sh 'echo "Hello world"'
        MYVAR = outputOf('echo do_something')
      }
    }
    
    stage ('Test') {
      steps {
        sh 'echo "${MYVAR}"'
        sh 'echo $MYVAR'
      }
    }

  }
}

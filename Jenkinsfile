def MYVAR

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
        MYVAR="test variable"
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

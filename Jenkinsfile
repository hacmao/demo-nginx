pipeline {
  agent {
    kubernetes {
      label "jenkins-docker-agent"
      idleMinutes 5
    }
  }
  stages {
    stage('Build') {
      steps {
        sh 'echo "Hello world"'
      }
    }

  }
}

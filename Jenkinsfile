pipeline {
  agent {
    kubernetes {
      label "kubernetes"
      idleMinutes 5
      yamlFile "build-pod.yaml"
      defaultContainer "docker"
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

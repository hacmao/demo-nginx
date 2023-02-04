@Library('shared-library')
import com.mcnz.uatInput
def uatInput = new uatInput()

pipeline {
  agent {
    kubernetes {
      label "jenkins-docker-agent"
      idleMinutes 5
      defaultContainer "docker"
    }
  }
  stages {
    stage('Build') {
      steps {
        sh 'echo "Hello world"'
      }
    }
    stage ('Run only if approval exists') {
      when {
          expression { uatInput.buildIsUatApproved() }
      }
      steps {
          echo "The build has been approved!!!"
      }
    }

  }
}

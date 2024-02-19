pipeline {
  agent {
    docker {
      image 'safesecurity/pytest:latest'
    }

  }
  stages {
    stage('Build') {
      steps {
        sh 'python -m py_compile sources/add2vals.py sources/calc.py'
        stash(name: 'compiled-results', includes: 'sources/*.py*')
      }
    }

    stage('Test') {
      post {
        always {
          junit 'test-reports/results.xml'
        }

      }
      steps {
        sh 'py.test --junit-xml test-reports/results.xml sources/test_calc.py'
      }
    }

    stage('Deliver') {
      
      post {
        success {
          archiveArtifacts 'dist/add2vals'
        }

      }
      steps {
        sh 'pyinstaller --onefile sources/add2vals.py'
      }
    }

  }
}
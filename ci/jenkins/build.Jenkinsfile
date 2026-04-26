pipeline {
  agent { kubernetes { yamlFile 'ci/jenkins/agent-pod.yaml' } }
  options { buildDiscarder(logRotator(numToKeepStr: '50')) timestamps() }
  environment {
    REGISTRY = 'harbor.helixcare.internal'
    PROJECT  = 'helixcare'
  }
  stages {
    stage('Checkout')      { steps { checkout scm } }
    stage('Lint')          { steps { sh 'make lint' } }
    stage('Unit')          { steps { sh 'make test' } }
    stage('Build images')  { steps { sh 'make docker-build' } }
    stage('Sign + SBOM') {
      steps {
        sh 'cosign sign --yes ${REGISTRY}/${PROJECT}/${SERVICE}:${BUILD_NUMBER}'
        sh 'syft ${REGISTRY}/${PROJECT}/${SERVICE}:${BUILD_NUMBER} -o spdx-json > sbom.json'
      }
    }
    stage('Push')          { steps { sh 'make docker-push TAG=${BUILD_NUMBER}' } }
  }
  post { always { archiveArtifacts artifacts: 'sbom.json', allowEmptyArchive: true } }
}

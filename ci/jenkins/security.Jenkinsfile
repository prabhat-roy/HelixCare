pipeline {
  agent { kubernetes { yamlFile 'ci/jenkins/agent-pod.yaml' } }
  triggers { cron('H 2 * * *') }
  stages {
    stage('Trivy image scan')   { steps { sh 'trivy image --severity HIGH,CRITICAL --exit-code 1 ${IMAGE}' } }
    stage('Trivy fs scan')      { steps { sh 'trivy fs --severity HIGH,CRITICAL --exit-code 1 .' } }
    stage('PHI grep')           { steps { sh 'scripts/phi-leak-scan.sh' } }
    stage('Cosign verify')      { steps { sh 'cosign verify --key cosign.pub ${IMAGE}' } }
    stage('OPA conftest')       { steps { sh 'conftest test --policy security/opa/policies kubernetes/' } }
    stage('Snyk SCA')           { steps { sh 'snyk test --severity-threshold=high' } }
    stage('Semgrep SAST')       { steps { sh 'semgrep --config=auto --error src/' } }
    stage('Checkov IaC')        { steps { sh 'checkov -d infra/terraform' } }
    stage('Gitleaks')           { steps { sh 'gitleaks detect --source . --no-banner' } }
  }
}

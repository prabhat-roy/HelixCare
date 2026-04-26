pipeline {
  agent { kubernetes { yamlFile 'ci/jenkins/agent-pod.yaml' } }
  parameters {
    choice(name: 'CLOUD',  choices: ['aws','gcp','azure'], description: 'Target cloud')
    choice(name: 'REGION', choices: ['us-east-1','us-central1','eastus','eu-west-1','europe-west1','westeurope'], description: 'Target region')
    string(name: 'SERVICE', defaultValue: 'api-gateway')
    string(name: 'TAG',     defaultValue: 'latest')
  }
  stages {
    stage('argocd app sync') {
      steps { sh 'argocd app sync ${SERVICE}-${CLOUD}-${REGION} --revision ${TAG}' }
    }
    stage('promote analysis') {
      steps { sh 'kubectl argo rollouts get rollout ${SERVICE} -n helixcare-${REGION} --watch --timeout 30m' }
    }
  }
}

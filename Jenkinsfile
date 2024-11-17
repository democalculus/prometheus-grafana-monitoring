//${library.jenkins-slack-library.version}
@Library('Slack-us-east-jenkins-prod') _

pipeline {

  agent { label 'eagunu-slave-agent' }

  options {
       buildDiscarder logRotator(
           artifactDaysToKeepStr: '5',
           artifactNumToKeepStr: '5',
           daysToKeepStr: '5',
           numToKeepStr: '5')
          timestamps()
        }

  environment {
    BUILD_NUMBER = "${env.BUILD_ID}"
  //   eagunu_pwd = 'eagunuworld_docker_hub_password'
  //   //eagunu docker registry repository
  //   registry = "eagunuworld/us-argocd-java-web-application"
  //   //eagunu dockerhub registry
  //   registryCredential = 'eagunuworld-docker-username-and-pwd'
  //   dockerImage = ''
  //   //latest_version_update
  //   imageVersion = "eagunuworld/us-argocd-java-web-application:v$BUILD_NUMBER"
  //   // This can be nexus3 or nexus2
  //   NEXUS_VERSION = "nexus3"
  //   // This can be http or https
  //   NEXUS_PROTOCOL = "http"
  //   // Where your Nexus is running
  //   NEXUS_URL = "18.216.167.207:8081"
  //   // Repository where we will upload the artifact
  //   NEXUS_REPOSITORY = "us-argocd-java-web-application"
  //   // Jenkins credential id to authenticate to Nexus OSS
  //   NEXUS_CREDENTIAL_ID = "nexus-username-password-creds-demoshool"
  //   //ARTIFACT_VERSION = "${BUILD_NUMBER}"
  //
  //    //invalid tag "eagunuworld/mss-maven-web-app:v1.1.1:20": invalid reference format
  //   //REGISTRY_CREDENTIAL = 'eagunuworld-docker-password-logins'
  //   //containerName = "devsecops-container"
  //   //serviceName = "devsecops-svc"
  // //  imageName = "siddharth67/numeric-app:${GIT_COMMIT}"
  //    jenkins_server_url = "http://3.143.147.204:8080/"
  //   mss_web_app = "/increment/99"
  }

  stages {
    stage('Cloning Git') {
            steps {
            git branch: 'prod-master', credentialsId: 'democalculus-github-login-creds', url: 'https://github.com/democalculus/prometheus-grafana-monitoring.git'
          }
        }

    stage('Deploy helm charts for prom and Grafana') {
          steps {
                sh "bash prometheus-grafana.sh"
                }
            }

    // stage('java_web_app_execute Deployment') {
    //         steps {
    //           parallel(
    //             "Deployment": {
    //                  sh 'bash java_web_app_execute.sh'
    //                 },
    //                 "Rollout Status": {
    //                   sh 'bash java_web_rollout.sh'
    //                     }
    //                   )
    //                 }
    //             }

}  //This line end the pipeline stages
  post {   //This line start the post script
        always {
         sendNotification currentBuild.result
        }
  }  //this line close post script stage
}    //This line close the jenkins pipeline

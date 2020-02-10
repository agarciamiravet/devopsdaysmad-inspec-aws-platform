pipeline {
         agent any
         environment {
               AWS_DEFAULT_REGION    = credentials('AWS_DEFAULT_REGION')
               AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
               AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
         }
         stages {
                 stage('Inspec Platform Tests') {
                    steps {
                          dir("${env.WORKSPACE}/src/inspec/devopsdaysmad-aws-platform"){
                                   
                                    catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                        sh "exit 1"
                                    }
                           }                          
                         }                 
                 }

                    stage('3') {
                        steps {
                            sh 'exit 0'
                        }
                    }
                }
         post {
        always {
            junit '**/src/inspec/devopsdaysmad-aws-platform/inspec_results.xml'
        }
               }
}

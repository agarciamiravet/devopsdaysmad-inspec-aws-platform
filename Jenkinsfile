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
                              sh 'inspec exec . -t aws:// --reporter cli junit:inspec_results.xml'
                           }                           
                 }
                 }             
                }
         post {
        always {
            junit '**/inspec_results.xml'
        }
               }
}
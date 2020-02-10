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
                                   
                                   try
                                   {
                                            sh '''                                                                     
                                              inspec exec . -t aws:// --reporter cli junit:inspec_results.xml json:output.json                                             
                                             ''' 
                                   }
                                   catch
                                   {
                                             echo "something failed"
                                   }
                                   
                                   sh'curl -F 'file=@output.json' -F 'platform=amazon-platform' http://localhost:5001/api/InspecResults/Upload'
                           }                          
                 }
                 }             
                }
         post {
        always {
            junit '**/src/inspec/devopsdaysmad-aws-platform/inspec_results.xml'
        }
               }
}

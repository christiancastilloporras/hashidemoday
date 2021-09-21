pipeline {
      agent any
      environment {
           CHKP_CLOUDGUARD_ID = credentials("CHKP_CLOUDGUARD_ID")
           CHKP_CLOUDGUARD_SECRET = credentials("CHKP_CLOUDGUARD_SECRET")
        }
        
  stages {
          
         stage('Clone Github repository') {
            
    
           steps {
             cleanWs() 
             checkout scm
           
             }
  
          }
          
    stage('ShiftLeft Code Scan') {   
       steps {   
                   
         script {      
              try {

             
                
            
                sh 'chmod +x shiftleft' 

                sh './shiftleft code-scan -s .'
           
               } catch (Exception e) {
    
                 echo "Request for Approval"  
                  }
              }
            }
         }
         
     stage('Code approval request') {
     
           steps {
             script {
               def userInput = input(id: 'confirm', message: 'Do you Approve to use this code?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Approve Code to Proceed', name: 'approve'] ])
              }
            }
          }
           
           
      stage('ShiftLeft Terraform Scan') {    
           
            steps {
                script {      
              try {
                     sh 'terraform init'
                     sh 'terraform plan -out=plan'
                     sh 'terraform show -json plan > plan.json'
                     sh './shiftleft iac-assessment -e bce8a7d2-d51a-4fce-ba93-362099ce3911 -p plan.json -r -64'
                   } catch (Exception e) {
    
                 echo "Request for Approval"  
                  }
                }  
             }
          }
            
       stage('Terraform scan approval request') {
     
           steps {
             script {
               def userInput = input(id: 'confirm', message: 'Do you Approve to use this container image?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Approve docker image to Proceed', name: 'approve'] ])
              }
            }
          }
        
  } 
}

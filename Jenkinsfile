ipeline {
      agent any
      environment {
           CHKP_CLOUDGUARD_ID = credentials("726ebf98-58ff-4ad0-a4bd-cc71b8663cae")
           CHKP_CLOUDGUARD_SECRET = credentials("tbgzej56x4bqxogzxytht5wqT")
        }
        
  stages {
          
         stage('Clone Github repository') {
            
    
           steps {
                 
              echo "checking the file"
              
             checkout scm
           
             }
  
          }
          
    stage('ShiftLeft Code Scan') {   
       steps {   
                   
         script {      
              try {

             
                
            
                sh 'chmod +x shiftleft' 

             
           
               } catch (Exception e) {
    
                 echo "Request for Approval"  
                  }
              }
            }
      
        
      stage('Terraform config policy Scan') {    
           
            steps {
         
                    sh './shiftleft iac-assessment -l S3Bucket should have encryption.serverSideEncryptionRules -p ./terraform'
                    
              }
            }
  } 
}


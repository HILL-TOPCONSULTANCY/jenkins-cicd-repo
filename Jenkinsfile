
pipeline {
    agent any

    tools {
         terraform 'Terraform'
     }

    environment {
            AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID') 
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    stages {
        stage("GIT CHECKOUT") {
            steps {
                echo "Pulling code from codebase"
                git branch: 'main', url: 'https://github.com/HIIL-TOP-CO-NSULTANCY/jenkins-cicd-repo.git'
                sh 'ls'
            }
        }
        
         stage("VERIFY TERRAFORM VERSION") {
            steps {
                echo "verifying the terrform version"
                sh 'terraform --version'
               
            }
        }
        
        stage("INITIALIZING TERRAFORM") {
            steps {
                echo "Initiliazing terraform"
                sh 'terraform init'
               
            }
        }
        
        stage("VALIDATING CONFIGURATION") {
            steps {
                echo "validating terraform configuration"
                sh 'terraform validate'
                sh 'pwd'
            }
        }
        
        stage('PLANNING') {
            steps {
                echo "planning terraform configuration"
                sh 'terraform plan'
               
            }
        }
        
        stage('Manual approval') {
            steps {
                
                input 'Approval required for deployment'
               
            }
        }
        

        stage("MANUAL VALIDATION") {
            steps {
                script {def userinput =input(id: 'Proceed', message:'Approval terraform Apply?', parameters[
                    [$class: 'TextParameterDefinition', defaultValues: 'Yes', description: 'Type Yes to approve', name:'Approval']
                ])
                if (userinput 'Yes'){
                    error "Pipeline aborted by user"
                }
                }
               
            }
        }
        
         stage('TERRAFORM APPLY') {
            steps {
                echo "applying configuration"
                sh 'terraform apply --auto-approve'
            } 
        }
post {
    always  {
        echo 'pipeline was successful'
    
    }
}

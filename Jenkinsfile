pipeline {
    agent any 

    triggers {
        pollSCM('* * * * *')
    }
    stages {
        stage('Docker compose build') {
            steps {
                echo '----------------- This is a docker-compose phase ----------'
                sh 'docker-compose up -d'
            }
        }
        
        
        
       /* this is the old pipeline code. Maintaining in case of revert!
        stage('run') {
            steps {
                echo '----------------- This is a compile phase ----------'
                sh 'mvn clean compile'
            }
        }
        
        stage('Maven Test') {
           steps {
               echo '----------------- This is a compile phase ----------'
               sh 'mvn clean test'
           }
        }
        
        stage('Maven Build') {
             steps {
                echo '----------------- This is a build phase ----------'
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Docker Build') {
            steps {
                echo '----------------- This is a build docker image phase ----------'
                sh '''
                    docker image build -t foodbox-service-rest .
                '''
            }
        }

        stage('Docker Deploy') {
            steps {
                echo '----------------- This is a docker deploment phase ----------'
                sh '''
                 (if  [ $(docker ps -a | grep foodbox-service-rest | cut -d " " -f1) ]; then \
                        echo $(docker rm -f foodbox-service-rest); \
                        echo "---------------- successfully removed ecom-webservice ----------------"
                     else \
                    echo OK; \
                 fi;);
            docker container run --restart always --name foodbox-service-rest -p 8081:8081 -d foodbox-service-rest
            '''
            }
        }
        */
    }
}
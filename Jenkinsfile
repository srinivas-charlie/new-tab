pipeline{
    agent any

    stages{
        stage{"git checkout"}{
            steps{
                git credentialsId: '51373499-ed92-4b48-ac28-94999d524896', url: 'https://github.com/srinivas-charlie/konsole-maven.git'
            }
        }
        stage{'Build'}{
            steps{
                sh 'mvn clean sonar:sonar deploy'
            }
            post{
                success{
                    echo "Archiving the Artifact"
                    archiveArtifacts artfacts: '**/target/*.war'
                }
            }

        }
        stage{'Deploy to tomcat server'}{
            steps{
                deploy adapters: [tomcat8(credentialsId: '54250d90-fada-49da-96d0-55d3a4e4a17d', path: '', url: 'http://192.168.43.26:1997/')], contextPath: 'local', war: '**/*.war'

            }

        }
    }
} 

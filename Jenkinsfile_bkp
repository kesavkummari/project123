node {
    // Define environment variables
    def awsCredentials = 'AWS_CREDENTIALS_ID' // ID of your AWS credentials stored in Jenkins
    def applicationName = 'YourApplicationName'
    def deploymentGroupName = 'YourDeploymentGroupName'
    def s3Bucket = 'your-s3-bucket-for-codedeploy'

    stage('Checkout') {
        // Checkout code from AWS CodeCommit
        git branch: 'main', url: 'https://git-codecommit.<region>.amazonaws.com/v1/repos/YourRepoName'
    }

    stage('Build') {
        // Build the Java project
        // Assuming you're using Maven for Java project build
        sh 'mvn clean package'
    }

    stage('Archive') {
        // Archive the build artifacts (e.g., Jar/War file)
        archiveArtifacts artifacts: '**/target/*.jar', fingerprint: true
    }

    stage('Deploy') {
        // AWS CodeDeploy deployment
        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: awsCredentials]]) {
            sh """
                # Prepare CodeDeploy application specification file (appspec.yml)
                cp appspec.yml target/

                # Zip the deployment package
                cd target
                zip -r deployment-package.zip *

                # Upload deployment package to S3
                aws s3 cp deployment-package.zip s3://${s3Bucket}/deployment-package.zip

                # Start the CodeDeploy deployment
                aws deploy create-deployment \
                    --application-name ${applicationName} \
                    --deployment-group-name ${deploymentGroupName} \
                    --s3-location bucket=${s3Bucket},bundleType=zip,key=deployment-package.zip
            """
        }
    }
}

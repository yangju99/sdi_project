pipeline {
    agent any

    environment {
        WORK_DIR = '/root/sdi'
    }

    stages {
        stage('CI') {
            steps {
                echo 'Running decomposition locally...'
                sh 'python3 CI/decomposition.py requirements.txt'
                // archiveArtifacts artifacts: 'composition_plan.yaml'
            }
        }

        stage('CV') {
            steps {
                echo 'Running simulation locally...'
                sh """
                    python3 CV/launch_gaz_sim.py composition_plan.yml
                """
                // archiveArtifacts artifacts: 'cv_results.json'
            }
        }
    }

    post {
        failure {
            echo 'Build failed!'
        }
        success {
            echo 'Build succeeded!'
        }
    }
}

pipeline {
    agent any
    stages {
        stage('Clean workspace') {
            steps {
                cleanWs()
            }
        }
        stage('checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/vamshikrishna1997/devops_task.git'
                sh "pwd"
                sh "ls"
            }
        }
        stage('docker install') {
            steps {
                sshagent(['app_server']) {
                    sh "ansible-playbook install_docker1.yml --check"
                }
            }
        }
        stage('docker deploy') {
            steps {
                sh "ansible-playbook docker_web.yml --check"
            }
        }
        stage('promtail installation') {
            steps {
                sh "ansible-playbook promtail.yml"
            }
        }
        stage('install loki') {
            steps {
                sh "ansible-playbook loki.yml"
            }
        }
        stage('install node_exporter') {
            steps {
                sh "ansible-playbook node_exporter.yml"
            }
        }
        stage('install prometheus') {
            steps {
                sshagent(['app_server']) {
                sh "ansible-playbook prometheus.yml"
            }
            }
        }
        stage('install grafana') {
            steps {
                sh "ansible-playbook grafana.yml"
            }
        }
    }
}

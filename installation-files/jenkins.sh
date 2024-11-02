#!/bin/bash
# Hardware requirements: Amazon Linux 2 Kernel 5.10 AMI with mimum t2.medium type instance & port 8080(jenkins), 9100 (node-exporter) should be allowed on the security groups

#Note: Dont use the latest EC2 Linux of 2023 as it doesnt have amazon-linux-extras which was used in the Jenkins installation as per the old AMI.

Prerequisite
AWS Acccount.
Create Redhat EC2 t2.medium Instance with 4GB RAM.
Create Security Group and open Required ports.
8080 got Jenkins, ..etc
Attach Security Group to EC2 Instance.
Install java openJDK 1.8+ for SonarQube version 7.8
Install Java JDK 1.8+ as Jenkins pre-requisit
Install other softwares - git, unzip and wget
```sh
sudo hostnamectl set-hostname ci
sudo yum -y install unzip wget tree git
```
```sh
sudo yum install java-11-openjdk -y
```
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
cd /etc/yum.repos.d/
sudo curl -O https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo yum -y install jenkins  --nobest

start Jenkins service and verify Jenkins is running
sudo systemctl start jenkins
sudo systemctl enable jenkins
sudo systemctl status jenkins

sudo cat /var/lib/jenkins/secrets/initialAdminPassword

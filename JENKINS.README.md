
# Hardware requirements: Amazon Linux 2 Kernel 5.10 AMI with
# Instance Type: mimum t2.medium type instance 
# Security Group: port 8080(jenkins), 9100 (node-exporter)


# Become a root
```sh
sudo su -
```
# Install Java 17
```sh
sudo amazon-linux-extras enable java-openjdk17
sudo yum install -y java-17-amazon-corretto
```
# Jenkins repo is added to yum.repos.d
```sh
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

# Import key from Jenkins
```sh
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
```

# Install Jenkins
```sh
yum install jenkins -y
```
```sh
systemctl enable jenkins
systemctl start jenkins
systemctl status jenkins
```
# Access Jenkins on the UI
http://<Public-IPv4-address>:8080/

## Домашнее задание к занятию "5.4. Практические навыки работы с Docker"

1. 
**Dockerfile Ponysay:**
```
FROM archlinux:latest

RUN pacman -Sy --noconfirm ponysay

ENTRYPOINT ["/usr/bin/ponysay"]
CMD ["Hey, netology"]
```

**Скриншот:**

<img align="top" src="img/ponysay.jpg">	<!--![ponysay](img/ponysay.jpg)-->  

**Ссылка на образ:**

https://hub.docker.com/r/owirtifo/ponysay

2. 
**Dockerfile Ubuntu:**
```
FROM ubuntu:ver2

WORKDIR /home/jenkins

RUN apt-get update && \
apt-get install -y wget && \
apt-get install -y openjdk-11-jdk && \
wget https://get.jenkins.io/war-stable/2.277.3/jenkins.war -nv && \
apt-get clean && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/usr/bin/java", "-jar", "jenkins.war"]

EXPOSE 8080/tcp
```
**Dockerfile Amazoncorretto:**
```
FROM amazoncorretto:ver1

WORKDIR /home/jenkins

RUN yum update -y && \
yum install -y wget && \
wget https://get.jenkins.io/war-stable/2.277.3/jenkins.war -nv && \
yum clean all

ENTRYPOINT ["/usr/bin/java", "-jar", "jenkins.war"]

EXPOSE 8080/tcp
```
**Скриншот лога Ubuntu:**

<img align="top" src="img/log_ubnt.jpg">	<!--![log_ubnt](img/log_ubnt.jpg)--> 

**Скриншот лога Amazoncorretto:**

<img align="top" src="img/log_amz.jpg">	<!--![log_amz](img/log_amz.jpg)--> 

**Скриншоты веб-интерфейса Jenkins:**

<img align="top" src="img/jenkins.jpg">	<!--![jenkins](img/jenkins.jpg)--> 

**Ссылка на образ Ubuntu:**

https://hub.docker.com/r/owirtifo/jenkins_ubnt

**Ссылка на образ Amazoncorretto:**

https://hub.docker.com/r/owirtifo/jenkins_amz

3. 
**Dockerfile Simplicite:**
```
FROM node

RUN git clone https://github.com/simplicitesoftware/nodejs-demo.git && \
cd /nodejs-demo && \
sed -i 's/localhost/0.0.0.0/g' app.js && \
npm install

WORKDIR /nodejs-demo

CMD ["npm", "start"]

EXPOSE 3000
```

**Скриншот вывода вызова команды списка docker сетей:**

<img align="top" src="img/docker_network.jpg">	<!--![docker_network](img/docker_network.jpg)--> 

**Скриншот вызова утилиты curl:**

<img align="top" src="img/curl.jpg">	<!--![curl](img/curl.jpg)--> 

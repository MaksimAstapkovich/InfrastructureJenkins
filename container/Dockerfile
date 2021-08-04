FROM jenkins/jenkins:lts-jdk11

USER root

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

RUN chmod -R 777 /var/jenkins_home

COPY ./files/plugins.txt /var/jenkins_home/
COPY ./scripts/scr_00* /var/jenkins_home/init.groovy.d/
COPY ./scripts/scr_01* /var/jenkins_home/init.groovy.d/
COPY ./scripts/scr_02* /var/jenkins_home/init.groovy.d/
COPY ./scripts/scr_03* /var/jenkins_home/init.groovy.d/
COPY ./scripts/scr_04*  /var/jenkins_home/workspace/seed/


RUN chmod -R 777 /var/jenkins_home

RUN /usr/local/bin/install-plugins.sh $(cat /var/jenkins_home/plugins.txt | tr '\n' ' ')

RUN apt-get update
RUN apt get install docker.io -y
EXPOSE 50000
EXPOSE 8080

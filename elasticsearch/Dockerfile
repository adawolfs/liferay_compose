FROM debian:8

MAINTAINER Alvin Estrada aestrada@digitalgeko.com

#Create user for elasticsearch
RUN useradd -ms /bin/bash esearch

#UPDATE REPOSITORY
RUN apt-get update

RUN apt-get install -y curl

#Copy elasticsearch to opt
ADD packages/elasticsearch /opt/elasticsearch
ADD packages /installers

#Extract Java
RUN tar -zxvf /installers/jdk* -C /opt/
RUN ln -s /opt/jdk* /opt/jdk
RUN rm -rf /installers

RUN chown -R esearch:esearch /opt/elasticsearch 

#Add elasticsearch and java to paht
ENV JAVA_HOME "/opt/jdk"
ENV JRE_HOME "/opt/jdk"
ENV PATH $PATH:/opt/elasticsearch/bin
ENV PATH $PATH:$JAVA_HOME/bin

#Expose ports
EXPOSE 9200
EXPOSE 9300

USER esearch
#Execute elasticsearch
CMD ["elasticsearch"]
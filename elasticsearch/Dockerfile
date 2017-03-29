FROM ubuntu:16.04

MAINTAINER Alvin Estrada aestrada@digitalgeko.com


#RUN apk --update add bash wget dpkg-dev

#Create user for elasticsearch
RUN useradd esearch

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
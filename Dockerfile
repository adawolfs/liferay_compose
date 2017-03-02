FROM debian:8

MAINTAINER Alvin Estrada aestrada@digitalgeko.com

# Add installers folder
ADD installers /installers

# Install JDK from /installers/packages/
RUN mkdir -p /opt
RUN tar -zxvf /installers/packages/jdk* -C /opt/
RUN ln -s /opt/jdk* /opt/jdk

#Install unzip
RUN dpkg -i /installers/packages/unzip*

# Install Liferay 
RUN unzip /installers/packages/liferay* -d /opt/
RUN ln -s /opt/liferay* /opt/liferay
RUN ln -s /opt/liferay/tomcat* /opt/liferay/tomcat

#Clean installers
RUN rm -rf /installers/packages


#Expose ports
EXPOSE 8080

ENV JAVA_HOME "/opt/jdk"
ENV JRE_HOME "/opt/jdk"
ENV PATH $PATH:$JAVA_HOME/bin

COPY ./installers/conf/portal-ext.properties /opt/liferay/
COPY ./installers/conf/com.liferay.portal.search.elasticsearch.configuration.ElasticsearchConfiguration.cfg /opt/liferay/osgi/modules/

CMD ["/opt/liferay/tomcat/bin/catalina.sh", "run"]
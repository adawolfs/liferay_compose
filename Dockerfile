FROM ubuntu:16.04

MAINTAINER Alvin Estrada aestrada@digitalgeko.com

# Add installers folder
ADD installers /installers

# Install JDK from /installers/packages/
RUN mkdir -p /opt
RUN mkdir -p /conf
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

#COPY ./installers/conf/portal-ext.properties /conf/
#COPY ./installers/conf/com.liferay.portal.search.elasticsearch.configuration.ElasticsearchConfiguration.cfg /conf/

#Create dummy config files
RUN touch /conf/portal-ext.properties
RUN touch /conf/system-ext.properties
RUN touch /conf/com.liferay.portal.store.s3.configuration.S3StoreConfiguration.cfg
RUN touch /conf/com.liferay.portal.search.elasticsearch.configuration.ElasticsearchConfiguration.cfg

#Create SymLinks
RUN ln -s /conf/portal-ext.properties /opt/liferay/portal-ext.properties
RUN ln -s /conf/system-ext.properties /opt/liferay/system-ext.properties
RUN ln -s /conf/com.liferay.portal.store.s3.configuration.S3StoreConfiguration.cfg /opt/liferay/osgi/configs/com.liferay.portal.store.s3.configuration.S3StoreConfiguration.cfg
RUN ln -s /conf/com.liferay.portal.search.elasticsearch.configuration.ElasticsearchConfiguration.cfg /opt/liferay/osgi/modules/com.liferay.portal.search.elasticsearch.configuration.ElasticsearchConfiguration.cfg

CMD ["/opt/liferay/tomcat/bin/catalina.sh", "run"]
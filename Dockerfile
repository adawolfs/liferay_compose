FROM debian:8

MAINTAINER Alvin Estrada aestrada@digitalgeko.com

ADD installers /installers
RUN /installers/conf/setup.sh

EXPOSE 22
EXPOSE 8080

ENV JAVA_HOME "/opt/jdk"
ENV JRE_HOME "/opt/jdk"
ENV PATH $PATH:$JAVA_HOME/bin
ENV CATALINA_BASE "/opt/liferay/tomcat"
ENV CATALINA_HOME "/opt/liferay/tomcat"
ENV CATALINA_TMPDIR "/opt/liferay/tomcat"
ENV CLASSPATH "/opt/liferay/tomcat/bin"

#SET portal-ext.properties
COPY ./installers/conf/portal-ext.properties /opt/liferay/
COPY ./installers/conf/com.liferay.portal.search.elasticsearch.configuration.ElasticsearchConfiguration.cfg /opt/liferay/osgi/modules/
#RUN /opt/liferay/tomcat/bin/startup.sh
#CMD ["tail", "-f", "/opt/liferay/tomcat/logs/catalina.out"]

CMD ["/opt/liferay/tomcat/bin/catalina.sh", "run"]
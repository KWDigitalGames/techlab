FROM tomcat:jre11
RUN curl -k -o /usr/local/tomcat/webapps/sample.war https://tomcat.apache.org/tomcat-10.1-doc/appdev/sample/sample.war
RUN chmod 775 /usr/local/tomcat/webapps/sample.war
EXPOSE 8080
CMD ["catalina.sh", "run"]

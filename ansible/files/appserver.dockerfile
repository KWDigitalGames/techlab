FROM tomcat:jre11
RUN curl -k -o /usr/local/tomcat/webapps/sample.war https://tomcat.apache.org/tomcat-10.1-doc/appdev/sample/sample.war && \
chmod 775 /usr/local/tomcat/webapps/sample.war
RUN apt-get update && apt-get install -y gnupg2 && \
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add - && \ 
apt-get install -y apt-transport-https && \
echo "deb https://artifacts.elastic.co/packages/8.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-8.x.list 
RUN apt-get update && apt-get install filebeat && \
update-rc.d filebeat defaults 95 10
RUN service filebeat start
EXPOSE 8080
EXPOSE 5044
CMD ["catalina.sh", "run"]
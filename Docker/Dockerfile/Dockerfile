#FROM ubuntu as build
#RUN mvn clean package

#FROM ubuntu
#COPY --from=build target/dummy.jar /app/dummy.jar
#CMD ["java","-jar","dummy.jar"]

###################

FROM ubuntu
#USER 1000
#WORKDIR /app
RUN apt-get update
RUN apt-get -y install apache2
#COPY index.html .
COPY index.html /var/www/html/
#ADD index.html /var/www/html/
#ADD myzipfile.tar.gz /var/www/html/
#ADD http://mysite.example.com/myfile.jpg /var/www/html/
ENV APP myapp
#ENV DB_SERVER fqdn
#ENV DB_PORT 5432
EXPOSE 80
#ENTRYPOINT [ "python3","-c"] 
CMD apachectl -D FOREGROUND
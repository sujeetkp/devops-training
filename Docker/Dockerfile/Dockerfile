#FROM ubuntu as build
#RUN mvn package -

#FROM ubuntu
#COPY --from=build target/dsada.jar /app/dsda.jar
#CMD ["java","-jar","dsada.jar"]

FROM ubuntu
#USER 1000
#WORKDIR /app
RUN apt-get update
RUN apt-get -y install apache2
#COPY index.html .
COPY index.html /var/www/html/
#ADD index.html /var/www/html/
ENV APP myapp
EXPOSE 80
#ENTRYPOINT [ "python3","-c"] 
CMD apachectl -D FOREGROUND
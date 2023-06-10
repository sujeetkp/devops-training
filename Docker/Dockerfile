FROM ubuntu
RUN apt-get update
RUN apt-get -y install apache2
COPY index.html /var/www/html/
ENV APP myapp
EXPOSE 80
CMD apachectl -D FOREGROUND
FROM docker.io/centos

MAINTAINER admin

RUN yum install httpd -y

RUN echo "srinivas" > /var/www/html/index.html

EXPOSE 80

CMD ["usr/sbin/httpd" "-D" "FOREGROUND"] 
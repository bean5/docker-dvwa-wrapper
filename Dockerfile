# http://blog.tjll.net/docker-dvwa-container/

FROM dockerfiles/centos-lamp
MAINTAINER You <you@yourdomain.com>
WORKDIR /var/www/html
RUN wget https://github.com/RandomStorm/DVWA/archive/v1.0.8.tar.gz -O- | tar xvz --strip-components=1
RUN service mysqld start && mysqladmin -uroot password p@ssw0rd && service mysqld stop
EXPOSE 80
CMD ["supervisord", "-n"]

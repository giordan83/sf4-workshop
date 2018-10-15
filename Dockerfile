FROM centos:latest

RUN yum -y install curl wget htop bind-utils telnet vim net-tools git mysql libpng libjpeg openssl icu

RUN wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && rpm -Uvh epel-release-latest-7.*.rpm
RUN rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm

# Setting timezone to Rome
RUN unlink /etc/localtime
RUN ln -s /usr/share/zoneinfo/Europe/Rome /etc/localtime

RUN yum -y --enablerepo=remi,remi-php71 install php-fpm \
	php-common \
	php-dev \
	php-cli \
	php-curl \
	php-bcmath \
	php-gd \
	php-intl \
	php-json \
	php-mbstring \
	php-mcrypt \
	php-mysqlnd \
	php-opcache \
	php-pdo \
	php-xml \
	php-xmlrpc \
	php-pecl-imagick \
	php-pecl-memcache \
	php-zip \
	php-posix

# Installing Composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

ADD docker/php/www.conf /etc/php-fpm.d/
ADD docker/php/fpm.conf /etc/php-fpm.conf
ADD docker/php/php.ini /etc/php.ini

RUN echo "alias ll='ls -la'" >> /etc/bashrc

RUN useradd ideato
RUN mkdir -p /var/www
RUN chown -R ideato:ideato /var/www

# Add folder & permission for sessions
RUN mkdir -p /var/www/sessions
RUN chown -R ideato:ideato /var/www

CMD ["/usr/sbin/php-fpm"]

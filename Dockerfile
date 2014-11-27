FROM debian:wheezy

MAINTAINER Christian Bayle, cbayle@gmail.com

RUN apt-get update ; \
    apt-get -y install \
    mysql-server \
    apache2 \
    libapache2-mod-php5 \
    php5-mysql \
    php5-gd \
    ssh \
    sudo \
    rsyslog \
    python-pip \
    vim \
    ; apt-get clean

RUN pip install supervisor

COPY supervisord.conf /etc/supervisord.conf
COPY index.php .htaccess .travis.yml /usr/share/question2answer/
COPY qa-content /usr/share/question2answer/qa-content
COPY qa-lang /usr/share/question2answer/qa-lang
COPY qa-theme /usr/share/question2answer/qa-theme
COPY qa-external-example /usr/share/question2answer/qa-external-example
COPY qa-plugin /usr/share/question2answer/qa-plugin
COPY qa-include /usr/share/question2answer/qa-include
COPY qa-tests /usr/share/question2answer/qa-tests

COPY qa-config-base.php /usr/share/question2answer/qa-config.php

WORKDIR /root

COPY q2a.conf /etc/apache2/sites-available/
RUN a2ensite q2a.conf
COPY run.sh /root/run.sh

VOLUME [ "/usr/share/question2answer" ]

EXPOSE 22 80 443

#CMD ["/root/run.sh"]

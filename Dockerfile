FROM ubuntu:latest
RUN apt-get update
RUN apt-get install python3 python3-pip  apache2 libapache2-mod-wsgi-py3 -y 
RUN pip3 install Django
RUN mkdir /var/www/Demo_DevOps && mkdir /var/www/logs
WORKDIR /var/www/Demo_DevOps
RUN django-admin.py startproject django_project /var/www/Demo_DevOps/
COPY ./000-default.conf /etc/apache2/sites-available/
COPY ./apache2.conf /etc/apache2/
COPY ./settings.py django_project/
EXPOSE 80 8000
RUN service apache2 restart
RUN python3 manage.py migrate
CMD python3 manage.py runserver 0.0.0.0:8000



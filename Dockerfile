FROM gcr.io/kodekloud/centos-ssh-enabled:master

RUN yum install -y sudo && yum clean all

RUN adduser maria && echo 'maria:maria' | chpasswd && usermod -aG wheel maria
RUN adduser john && echo 'john:john' | chpasswd && usermod -aG wheel john

RUN echo "john    ALL=(ALL)   NOPASSWD:ALL" >> /etc/sudoers

RUN rm -f /var/run/nologin

RUN yum install --downloadonly mariadb libselinux-python libsemanage-python firewalld mariadb-server MySQL-python httpd php php-mysql git
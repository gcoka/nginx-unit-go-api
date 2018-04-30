FROM ubuntu:17.10

# ADD unit.repo /etc/yum.repos.d/

# RUN yum install unit
# RUN yum install unit-go

RUN apt update -y
RUN apt-get install -y build-essential git sudo net-tools curl
RUN apt-get install -y golang
RUN apt-get install -y php-dev libphp-embed

WORKDIR /home/user/go_apps
ENV GOPATH=/home/user/go_apps

WORKDIR /
RUN git clone https://github.com/nginx/unit

WORKDIR /unit

RUN ./configure --prefix=/opt/unit --pid=/var/unit.pid --log=/var/log/unit.log --modules=modules --state=state
RUN ./configure go
RUN ./configure php

RUN make all
RUN make install

CMD ["/opt/unit/sbin/unitd", "--no-daemon", "--control", "unix:/var/run/control.unit.sock"]

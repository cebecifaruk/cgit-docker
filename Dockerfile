FROM httpd:2.4-alpine

RUN apk update
RUN apk add git git-daemon cgit

RUN git config --system http.receivepack true
RUN git config --system http.uploadpack true

RUN mkdir /git

COPY ./httpd.conf /usr/local/apache2/conf/httpd.conf
COPY ./cgit.conf /etc/cgitrc

WORKDIR /

EXPOSE 80/tcp
FROM alpine:3.16.2
  
RUN apk update && apk add --upgrade dante-server

COPY danted.conf /etc/sockd.conf

CMD ["/usr/sbin/sockd"]


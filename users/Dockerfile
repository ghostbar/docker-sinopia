FROM busybox
MAINTAINER Jose-Luis Rivas <me@ghostbar.co>
RUN adduser -D -g "Sinopia" sinopia
USER sinopia
VOLUME /opt/sinopia
ADD /users.sh /tmp/users.sh

CMD ["sh", "/tmp/users.sh"]

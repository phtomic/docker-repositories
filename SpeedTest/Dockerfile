# <application> Dockerfile #
############################
FROM debian:11-slim
WORKDIR /ookla
ADD ooklaserver.sh /ooklaserver.sh
RUN chmod +x /ooklaserver.sh
RUN apt update && apt install curl -y
RUN /ooklaserver.sh install
RUN mkdir /opt/base && mkdir /ookla/certs && cp -r /ookla/* /opt/base
#SYMLINKs

ADD entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh
#PORTS
EXPOSE 8080 5060
CMD ["/usr/bin/entrypoint.sh"]
# <application> Dockerfile #
############################
FROM debian:11-slim
WORKDIR /nperf
RUN su && apt-get update && apt-get -y install lsb-release gnupg wget iptables
RUN wget -qO- https://repo.nperf.com/apt/conf/nperf-server.gpg.key | gpg --dearmor > /usr/share/keyrings/nperf-archive-keyring.gpg
RUN echo "deb [arch=amd64 signed-by=/usr/share/keyrings/nperf-archive-keyring.gpg] https://repo.nperf.com/apt $(lsb_release -sc) main non-free" >> /etc/apt/sources.list.d/nperf.list
RUN apt-get update
RUN apt-get -y install nperf-server
#SYMLINKs
RUN cp -r /etc/nperf /opt/base
RUN rm -R /etc/nperf
RUN ln -s /usr/sbin/iptables /sbin/iptables
RUN ln -s /usr/sbin/iptables-save /sbin/iptables-save
RUN ln -s /nperf/ /etc/nperf

ADD entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh
#PORTS
EXPOSE 8080 5060
CMD ["/usr/bin/entrypoint.sh"]
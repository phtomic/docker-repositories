# mechanic-proxy Dockerfile #
############################
FROM node:18-buster
RUN apt update -y
RUN apt install nginx certbot python-certbot-nginx -y
RUN service nginx start
RUN npm install mechanic -g
RUN mechanic list
RUN mkdir -p /var/log/mechanic-proxy
RUN mkdir -p /opt/base
ADD application.logrotate /etc/logrotate.d/mechanic-proxy
ADD template.conf /usr/local/lib/node_modules/mechanic/template.conf
RUN chmod 777 /usr/local/lib/node_modules/mechanic/template.conf
#ADD <base_application> /opt/base
RUN cp -r /etc/letsencrypt/ /opt/base/letsencrypt
RUN cp -r /etc/nginx/ /opt/base/nginx
RUN cp -r /var/lib/misc/ /opt/base/data
RUN rm -R /etc/nginx
RUN rm -R /var/lib/misc
RUN rm -R /etc/letsencrypt

#SYMLINKs
RUN ln -s /mechanic-proxy/nginx/ /etc/nginx
RUN ln -s /mechanic-proxy/letsencrypt/ /etc/letsencrypt
RUN ln -s /mechanic-proxy/data/ /var/lib/misc

ADD run_with_env.sh /usr/bin/run_with_env.sh
ADD entrypoint.sh /usr/bin/entrypoint.sh
ADD nginx_mechanic_reload.sh /usr/bin/nginx_mechanic_reload.sh
RUN chmod +x /usr/bin/run_with_env.sh
RUN chmod +x /usr/bin/nginx_mechanic_reload.sh
RUN chmod +x /usr/bin/entrypoint.sh
WORKDIR /mechanic-proxy
#PORTS
EXPOSE 80 443
CMD ["/usr/bin/entrypoint.sh"]
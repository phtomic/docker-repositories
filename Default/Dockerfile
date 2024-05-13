# <application> Dockerfile #
############################
FROM node:18-slim
RUN npm install pm2 -g
RUN mkdir -p /var/log/<application>
ADD application.logrotate /etc/logrotate.d/<application>
ADD <base_application> /opt/base


#SYMLINKs




ADD run_with_env.sh /usr/bin/run_with_env.sh
ADD entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/run_with_env.sh
RUN chmod +x /usr/bin/entrypoint.sh
WORKDIR /<application>
#PORTS
EXPOSE 3000 7547 7557 7567 27017
CMD ["/usr/bin/entrypoint.sh"]
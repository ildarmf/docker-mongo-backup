FROM mongo:3
MAINTAINER Muslimov Ildar

WORKDIR /

RUN apt-get update && \
	apt-get install -y vim && \
	apt-get install -y cron && \
	apt-get install -y s3cmd

COPY backup.sh /
RUN chmod +x /backup.sh
RUN mkdir /backup
COPY .s3cfg /root/

COPY hello-cron /etc/cron.d/hello-cron

COPY start.sh /
RUN chmod +x /start.sh

COPY cron.sh /
RUN chmod +x /cron.sh

RUN crontab /etc/cron.d/hello-cron

#CMD ["cron", "-f"]

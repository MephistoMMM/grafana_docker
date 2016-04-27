From ubuntu:14.04
MAINTAINER mpsss <mephistommm@gmail.com>

#add time and version
ENV DOCKERBUILD_TIME 16.04.29
ENV GRAFANA_VERSION 2.5.0

# Custom sources.list
COPY sources.list /etc/apt/sources.list

# Update Base System
RUN apt-get update && apt-get -y upgrade

WORKDIR /opt
# Install grafana
RUN apt-get install -y libfontconfig 
COPY grafana_2.5.0_amd64.deb /opt
RUN dpkg -i grafana_$GRAFANA_VERSION_amd64.deb

EXPOSE 3000
VOLUME /var/log/

# Add run.sh 
COPY run.sh /opt
CMD [ "./run.sh"]

From ubuntu:14.04
MAINTAINER mpsss <mephistommm@gmail.com>

#add time
ENV DOCKERBUILD_TIME 15.11.08

# Custom sources.list
COPY sources.list /etc/apt/sources.list

# Update Base System
RUN apt-get update && apt-get -y upgrade

WORKDIR /opt

# Install Python &  Node.js &  git & npm
RUN apt-get install -y adduser libfontconfig 
COPY run.sh /opt
COPY grafana_2.5.0_amd64.deb /opt
RUN dpkg -i grafana_2.5.0_amd64.deb
RUN service grafana-server start

EXPOSE 3000
VOLUME /var/log/

CMD [ "./run.sh"]
#CMD ["/bin/bash"]

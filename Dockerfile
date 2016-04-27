From ubuntu:14.04
MAINTAINER mpsss <mephistommm@gmail.com>

#add time and version
ENV DOCKERBUILD_TIME 16.04.29
ENV GRAFANA_VERSION 3.0.0-beta51460725904

# Custom sources.list
COPY sources.list /etc/apt/sources.list

# Install grafana
apt-get -y --no-install-recommends install libfontconfig curl ca-certificates && \
    apt-get clean && \
    curl https://grafanarel.s3.amazonaws.com/builds/grafana_${GRAFANA_VERSION}_amd64.deb > /tmp/grafana.deb && \
    dpkg -i /tmp/grafana.deb && \
    rm /tmp/grafana.deb && \
    apt-get remove -y curl && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

VOLUME ["/var/lib/grafana", "/var/lib/grafana/plugins", "/var/log/grafana", "/etc/grafana"]

EXPOSE 3000

COPY ./run.sh /run.sh

# Add run.sh 
ENTRYPOINT ["/run.sh"]

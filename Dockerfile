# influxdb

FROM ubuntu

RUN mkdir -p /opt/influxdb/shared/data

ADD https://s3.amazonaws.com/influxdb/influxdb_0.9.6.1_amd64.deb /influxdb.deb
RUN dpkg -i influxdb.deb

RUN rm -rf /opt/influxdb/shared/data

ADD config.toml /opt/influxdb/shared/config.toml

EXPOSE 8083 8086 2004

ENTRYPOINT ["/usr/bin/influxd"]
CMD ["-config=/opt/influxdb/shared/config.toml"]

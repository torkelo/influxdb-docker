# influxdb

FROM ubuntu

RUN mkdir -p /opt/influxdb/shared/data

ADD http://s3.amazonaws.com/influxdb/influxdb_0.8.0_amd64.deb /influx8.deb
RUN dpkg -i /influx8.deb
RUN rm -rf /opt/influxdb/shared/data

ADD config.toml /opt/influxdb/shared/config.toml

EXPOSE 8083 8086 2004

ENTRYPOINT ["/usr/bin/influxdb"]
CMD ["-config=/opt/influxdb/shared/config.toml"]

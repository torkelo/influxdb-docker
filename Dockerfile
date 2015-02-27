# influxdb

FROM ubuntu

RUN mkdir -p /opt/influxdb/shared/data

ADD http://get.influxdb.org/influxdb_0.9.0-rc4_amd64.deb /influx94.deb
RUN dpkg -i /influx94.deb
RUN rm -rf /opt/influxdb/shared/data

ADD config.toml /opt/influxdb/shared/config.toml

EXPOSE 8083 8086 2004

ENTRYPOINT ["/opt/influxdb/influxd"]
CMD ["-config=/opt/influxdb/shared/config.toml"]

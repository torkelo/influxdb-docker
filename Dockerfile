# influxdb

FROM ubuntu

RUN mkdir -p /opt/influxdb/shared/data

ADD http://get.influxdb.org/influxdb_0.9.0-rc30_amd64.deb /influx930.deb
RUN dpkg -i /influx930.deb
RUN rm -rf /opt/influxdb/shared/data

ADD config.toml /opt/influxdb/shared/config.toml

EXPOSE 8083 8086 2004

ENTRYPOINT ["/opt/influxdb/influxd"]
CMD ["-config=/opt/influxdb/shared/config.toml"]

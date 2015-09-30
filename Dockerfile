# influxdb

FROM ubuntu

RUN mkdir -p /opt/influxdb/shared/data

ADD https://s3.amazonaws.com/influxdb/influxdb_0.9.4.1_amd64.deb /influx940.deb
RUN dpkg -i /influx940.deb

RUN rm -rf /opt/influxdb/shared/data

ADD config.toml /opt/influxdb/shared/config.toml

EXPOSE 8083 8086 2004

ENTRYPOINT ["/opt/influxdb/influxd"]
CMD ["-config=/opt/influxdb/shared/config.toml"]

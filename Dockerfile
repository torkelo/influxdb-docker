# influxdb 

FROM debian:jessie

RUN mkdir -p /opt/influxdb/shared/data

ADD http://s3.amazonaws.com/influxdb/influxdb_latest_amd64.deb /influxdb_latest_amd64.deb
RUN dpkg -i /influxdb_latest_amd64.deb
RUN rm -rf /opt/influxdb/shared/data

EXPOSE 8083 8086

ENTRYPOINT ["/usr/bin/influxdb"]
CMD ["-config=/opt/influxdb/shared/config.toml"]

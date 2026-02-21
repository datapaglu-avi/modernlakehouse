FROM minio/minio:RELEASE.2025-09-07T16-13-09Z

COPY ./seed-data/sample-data.csv /opt/seed-data/
COPY entrypoint.sh /opt/bootstrap.sh

RUN chmod +x /opt/bootstrap.sh

ENTRYPOINT ["/opt/bootstrap.sh"]
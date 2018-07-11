FROM java:8-jre-alpine

ENV OPENREFINE_VERSION 3.0-beta
ENV OPENREFINE_FILE openrefine-linux-${OPENREFINE_VERSION}.tar.gz

WORKDIR /app

COPY ${OPENREFINE_FILE} /app

RUN set -xe && apk add --no-cache bash curl jq tar

RUN tar xzf ${OPENREFINE_FILE} --strip 1

COPY refine /app

VOLUME /data
WORKDIR /data

EXPOSE 3333

ENTRYPOINT ["/app/refine"]
CMD ["-i", "0.0.0.0", "-d", "/data"]

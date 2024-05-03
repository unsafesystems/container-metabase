FROM metabase/metabase:v0.49.8 as build


FROM amazoncorretto:21.0.2

COPY --from=build /app /app

RUN yum -y install shadow-utils && \
	adduser -ms /bin/sh metabase && chown -R metabase /app && \
    chmod +x /app/run_metabase.sh

WORKDIR /app
USER metabase

ENTRYPOINT ["/app/run_metabase.sh"]

FROM metabase/metabase:v0.48.3 as build


FROM amazoncorretto:21.0.1

COPY --from=build /app /app

RUN yum -y install shadow-utils && \
	adduser -ms /bin/sh metabase && chown -R metabase /app && \
    chmod +x /app/run_metabase.sh

WORKDIR /app
USER metabase

ENTRYPOINT ["/app/run_metabase.sh"]

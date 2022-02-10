FROM docker.io/library/postgres:14

ENV POSTGRES_PASSWORD postgres
ENV TOOLFORDEV_DB toolfordev
ENV TOOLFORDEV_USER toolfordev
ENV TOOLFORDEV_PASSWORD toolfordev

COPY --chown=999:999 --chmod=770 /scripts /tmd/scripts

RUN apt-get update; \
    apt-get install -y gettext-base; \
    rm -rf /var/lib/apt/lists/*; \
    echo -e "#!/bin/bash\nset -e\nbash -e /tmd/scripts/script.sh" > /docker-entrypoint-initdb.d/01-toolfordev-entrypoint.sh; \
    chown 999:999 /docker-entrypoint-initdb.d/01-toolfordev-entrypoint.sh; \
    chmod 770 /docker-entrypoint-initdb.d/01-toolfordev-entrypoint.sh

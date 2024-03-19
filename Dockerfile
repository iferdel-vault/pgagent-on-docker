FROM postgres

RUN : \
    && apt-get update \
    && apt-get upgrade -y \
    && :

RUN : \
    && apt-get install -y \
    pgagent

# Add a script to start pgAgent and PostgreSQL (You'll need to create this)
COPY ./start-pgagent.sh /usr/local/bin/start-pgagent.sh
RUN chmod +x /usr/local/bin/start-pgagent.sh

ENTRYPOINT ["start-pgagent.sh"]
CMD ["postgres"]

FROM mongo:latest

ENV MONGO_INITDB_ROOT_USERNAME=user
ENV MONGO_INITDB_ROOT_PASSWORD=pass
ENV MONGO_INITDB_DATABASE=qod

WORKDIR /data

COPY quotes.json run.sh /data/

RUN chmod +x /data/run.sh

EXPOSE 27017

CMD ["/data/run.sh"]
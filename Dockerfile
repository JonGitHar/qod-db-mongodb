FROM mongo:latest

ENV MONGO_INITDB_ROOT_USERNAME=user
ENV MONGO_INITDB_ROOT_PASSWORD=pass
ENV MONGO_INITDB_DATABASE=qod

COPY run.sh /run.sh
COPY quotes.json /data/quotes.json

RUN chmod +x /run.sh

EXPOSE 27017

CMD ["/run.sh"]

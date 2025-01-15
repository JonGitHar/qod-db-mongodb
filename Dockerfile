FROM registry.redhat.io/rhscl/mongodb-34-rhel7

ENV MONGODB_USER=user \
    MONGODB_PASSWORD=pass \
    MONGODB_DATABASE=qod \
    MONGODB_ADMIN_PASSWORD=admin_pass

COPY run.sh /usr/local/bin/run.sh
COPY quotes.json /tmp/quotes.json

RUN chgrp -R 0 /azp && \
    chmod -R g=u /azp && \ 
    chmod 775 /usr/local/bin/run.sh

EXPOSE 27017

RUN /usr/local/bin/run.sh
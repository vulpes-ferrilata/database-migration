FROM migrate/migrate:latest

ENV MONGO_ADDRESS=127.0.0.1:27017
ENV MONGO_USERNAME=root
ENV MONGO_PASSWORD=123456

ENV CASSANDRA_ADDRESS=127.0.0.1:9042
ENV CASSANDRA_USERNAME=cassandra
ENV CASSANDRA_PASSWORD=cassandra

WORKDIR /

COPY . .

ENTRYPOINT [""]

CMD migrate -path "/migrations/user" -database "mongodb://$MONGO_USERNAME:$MONGO_PASSWORD@$MONGO_ADDRESS/user?authSource=admin&directConnection=true" up && \
migrate -path "/migrations/authentication" -database "mongodb://$MONGO_USERNAME:$MONGO_PASSWORD@$MONGO_ADDRESS/authentication?authSource=admin&directConnection=true" up && \
migrate -path "/migrations/catan" -database "mongodb://$MONGO_USERNAME:$MONGO_PASSWORD@$MONGO_ADDRESS/catan?authSource=admin&directConnection=true" up && \
migrate -path "/migrations/chat" -database "cassandra://$CASSANDRA_ADDRESS/chat?username=$CASSANDRA_USERNAME&password=$CASSANDRA_PASSWORD" up
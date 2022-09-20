FROM migrate/migrate:latest

ENV DATABASE_ADDRESS=127.0.0.1:27017
ENV DATABASE_USER=root
ENV DATABASE_PASSWORD=123456

WORKDIR /

COPY . .

ENTRYPOINT [""]

CMD migrate -path "/migrations/user" -database "mongodb://$DATABASE_USER:$DATABASE_PASSWORD@$DATABASE_ADDRESS/user?authSource=admin&directConnection=true" up && migrate -path "/migrations/authentication" -database "mongodb://$DATABASE_USER:$DATABASE_PASSWORD@$DATABASE_ADDRESS/authentication?authSource=admin&directConnection=true" up && migrate -path "/migrations/catan" -database "mongodb://$DATABASE_USER:$DATABASE_PASSWORD@$DATABASE_ADDRESS/catan?authSource=admin&directConnection=true" up
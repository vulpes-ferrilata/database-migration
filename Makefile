MONGO_ADDRESS?=127.0.0.1:27017
MONGO_USERNAME?=root
MONGO_PASSWORD?=123456

CASSANDRA_ADDRESS?=127.0.0.1:9042
CASSANDRA_USERNAME?=cassandra
CASSANDRA_PASSWORD?=cassandra

migrate-user-up:
	migrate -path "./migrations/user" -database "mongodb://$(MONGO_USERNAME):$(MONGO_PASSWORD)@$(MONGO_ADDRESS)/user?authSource=admin&directConnection=true" up

migrate-authentication-up:
	migrate -path "./migrations/authentication" -database "mongodb://$(MONGO_USERNAME):$(MONGO_PASSWORD)@$(MONGO_ADDRESS)/authentication?authSource=admin&directConnection=true" up

migrate-catan-up:
	migrate -path "./migrations/catan" -database "mongodb://$(MONGO_USERNAME):$(MONGO_PASSWORD)@$(MONGO_ADDRESS)/catan?authSource=admin&directConnection=true" up

migrate-chat-up:
	migrate -path "./migrations/chat" -database "cassandra://$(CASSANDRA_ADDRESS)/chat?username=$(CASSANDRA_USERNAME)&password=$(CASSANDRA_PASSWORD)" up

migrate-user-down:
	migrate -path "./migrations/user" -database "mongodb://$(MONGO_USERNAME):$(MONGO_PASSWORD)@$(MONGO_ADDRESS)/user?authSource=admin&directConnection=true" down

migrate-authentication-down:
	migrate -path "./migrations/authentication" -database "mongodb://$(MONGO_USERNAME):$(MONGO_PASSWORD)@$(MONGO_ADDRESS)/authentication?authSource=admin&directConnection=true" down

migrate-catan-down:
	migrate -path "./migrations/catan" -database "mongodb://$(MONGO_USERNAME):$(MONGO_PASSWORD)@$(MONGO_ADDRESS)/catan?authSource=admin&directConnection=true" down

migrate-chat-down:
	migrate -path "./migrations/chat" -database "cassandra://$(CASSANDRA_ADDRESS)/chat?username=$(CASSANDRA_USERNAME)&password=$(CASSANDRA_PASSWORD)" down

.PHONY: migrate-user-up migrate-authentication-up migrate-catan-up migrate-chat-up migrate-user-down migrate-authentication-down migrate-catan-down migrate-chat-down
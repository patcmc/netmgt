.PHONY: setup start stop

# Install dependencies and set up the environment
setup:
	@echo "Setting up the environment..."
	docker compose build

# Run the Rails server
start:
	@echo "Starting the Rails server..."
	docker compose up -d

# Stop the Rails server
stop:
	@echo "Stopping the Rails server..."
	docker compose down

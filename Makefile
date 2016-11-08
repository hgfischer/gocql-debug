help:
	@echo "make [target]"
	@echo " Targets: "
	@echo "   dev-deps    Install development dependencies  "
	@echo "   vm          Initialize Virtualbox VM          "
	@echo "   migrate     Rollout migrations                "
	@echo "   reset       Rollback and rollout migrations   "
	@echo "   down        Rollback migrations               "


dev-deps:
	go get github.com/mattes/migrate


vm:	dev-deps
	vagrant box update
	vagrant up

IP := `cat VagrantBoxIP`

migrate: dev-deps
	migrate -url cassandra://`cat VagrantBoxIP`/test_keyspace -path ./migrations up

reset: dev-deps
	migrate -url cassandra://`cat VagrantBoxIP`/test_keyspace -path ./migrations reset

down: dev-deps
	migrate -url cassandra://`cat VagrantBoxIP`/test_keyspace -path ./migrations down


all: vm migrate
	go run main.go
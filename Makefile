OUT_DIR=./build
EXE_NAME=goapi
BUILD_CMD_LOCAL=go build -o $(OUT_DIR)/$(EXE_NAME) main.go

.PHONY: start
start:
	nodemon -x "pkill $(EXE_NAME) & ($(BUILD_CMD_LOCAL) || exit 1) && ($(OUT_DIR)/$(EXE_NAME) || exit 1)"

.PHONY: dep
dep:
	dep ensure

list-listener:
	docker-compose exec nginx-unit curl --unix-socket /var/run/control.unit.sock http://127.0.0.1

update-go:
	docker-compose exec nginx-unit curl -X PUT -d @/root/json/api.json --unix-socket /var/run/control.unit.sock http://127.0.0.1/

update-php:
	docker-compose exec nginx-unit curl -X PUT -d @/root/json/php.json --unix-socket /var/run/control.unit.sock http://127.0.0.1/


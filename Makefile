OUT_DIR=./build
EXE_NAME=goapi
BUILD_CMD_LOCAL=go build -o $(OUT_DIR)/$(EXE_NAME) main.go

.PHONY: start
start:
	nodemon -x "pkill $(EXE_NAME) & ($(BUILD_CMD_LOCAL) || exit 1) && ($(OUT_DIR)/$(EXE_NAME) || exit 1)"

.PHONY: dep
dep:
	dep ensure

VENDOR_DIR=./vendor

# See: https://developers.diem.com/main/docs/tutorial-my-first-transaction
clone:
	cd $(VENDOR_DIR); git clone https://github.com/diem/diem.git
	cd $(VENDOR_DIR)/diem; git checkout testnet

dev-setup:
	cd $(VENDOR_DIR)/diem; ./scripts/dev_setup.sh

start-cli-testnet:
	cd $(VENDOR_DIR)/diem; ./scripts/cli/start_cli_testnet.sh

#　See: https://developers.diem.com/main/docs/configure-run-public-fullnode
get-testnet-files:
	curl -L https://testnet.diem.com/genesis.blob --output $(VENDOR_DIR)/diem/genesis.blob
	curl -L https://testnet.diem.com/waypoint.txt --output $(VENDOR_DIR)/diem/waypoint.txt

show-fullnode-config-example:
	cat $(VENDOR_DIR)/diem/docker/compose/public_full_node/public_full_node.yaml

start-fullnode:
	source ~/.cargo/env
	cd $(VENDOR_DIR)/diem; cargo run -p diem-node --release -- -f ../../public_full_node.yaml

show-sync-state:
	curl 127.0.0.1:9101/metrics 2> /dev/null | grep diem_state_sync_version | grep type

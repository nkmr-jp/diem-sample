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
init-fullnode-config:
	cp $(VENDOR_DIR)/diem/config/src/config/test_data/public_full_node.yaml ./
	curl -L https://testnet.diem.com/genesis.blob --output genesis.blob
	curl -L https://testnet.diem.com/waypoint.txt --output waypoint.txt

fullnode-config-example:
	cat $(VENDOR_DIR)/diem/docker/compose/public_full_node/public_full_node.yaml
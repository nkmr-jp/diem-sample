VENDOR_DIR=./vendor

# See: https://developers.diem.com/main/docs/tutorial-my-first-transaction
clone:
	@cd $(VENDOR_DIR); git clone https://github.com/diem/diem.git
	@cd $(VENDOR_DIR)/diem; git checkout testnet

dev-setup:
	@cd $(VENDOR_DIR)/diem; ./scripts/dev_setup.sh

start-testnet-cli:
	@cd $(VENDOR_DIR)/diem; ./scripts/cli/start_cli_testnet.sh

#　See: https://developers.diem.com/main/docs/configure-run-public-fullnode
get-testnet-files:
	@curl -L https://testnet.diem.com/genesis.blob --output $(VENDOR_DIR)/diem/genesis.blob
	@curl -L https://testnet.diem.com/waypoint.txt --output $(VENDOR_DIR)/diem/waypoint.txt

show-fullnode-config-example:
	@cat $(VENDOR_DIR)/diem/docker/compose/public_full_node/public_full_node.yaml

start-testnet-fullnode:
	@source ~/.cargo/env
	@cd $(VENDOR_DIR)/diem; cargo run -p diem-node --release -- -f ../../public_full_node.yaml

show-sync-state:
	@curl 127.0.0.1:9101/metrics 2> /dev/null | grep diem_state_sync_version | grep type

show-data-volume:
	@du -ghs $(VENDOR_DIR)/diem/data


# See: https://developers.diem.com/main/docs/tutorial-run-local-validator-nw
start-local-network:
	@cd $(VENDOR_DIR)/diem; cargo run -p diem-node -- --test

ROOT_KEY=""
WAYPOINT=""
start-local-cli:
	@cd $(VENDOR_DIR)/diem; cargo run -p cli -- -c TESTING -m $(ROOT_KEY) -u http://127.0.0.1:8080 --waypoint $(WAYPOINT)


# See: https://developers.diem.com/main/docs/tutorial-my-first-client
clone-sdk:
	@cd $(VENDOR_DIR); git clone https://github.com/diem/my-first-client.git

run-python-sdk-all-examples:
	@cd $(VENDOR_DIR)/my-first-client; make python

run-my-first-client:
	@cd $(VENDOR_DIR)/my-first-client/python; pipenv run python src/my_first_client.py

run-generate-keys-example:
	@cd $(VENDOR_DIR)/my-first-client/python; pipenv run python src/generate_keys_example.py

run-get-account-example:
	@cd $(VENDOR_DIR)/my-first-client/python; pipenv run python src/get_account_example.py

run-get-events-example:
	@cd $(VENDOR_DIR)/my-first-client/python; pipenv run python src/get_events_example.py

run-intent-identifier-example:
	@cd $(VENDOR_DIR)/my-first-client/python; pipenv run python src/intent_identifier_example.py

run-mint-example:
	@cd $(VENDOR_DIR)/my-first-client/python; pipenv run python src/mint_example.py

run-submit-peer-to-peer-transaction-example:
	@cd $(VENDOR_DIR)/my-first-client/python; pipenv run python src/submit_peer_to_peer_transaction_example.py


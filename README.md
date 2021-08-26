# diem-sample

## Testnetに接続

リポジトリ取得
```sh
make clone
```

開発環境セットアップ
```sh
make dev-setup
```

cliでテストネットに接続
```sh
make testnet-cli
```

## Testnet の Fullnodeを起動

testnetのgenesisとwaypointファイル取得
```sh
make get-testnet-files
```

fullnode起動
```sh
make start-tetnet-fullnode
```

fullnodeの設定ファイルのExampleを見る(public_full_node.yaml編集時の参考に)
```sh
make show-fullnode-config-example
```

同期状況を確認する
```sh
make show-sync-state
# > diem_state_sync_version{type="committed"} 1697861
# > diem_state_sync_version{type="highest"} 2274720
# > diem_state_sync_version{type="synced"} 1780861
# > diem_state_sync_version{type="target"} 2274720
```

testnetのfullnodeのデータ量を確認する
```sh
make show-data-volume
```

## ローカルネットワークを起動

ネットワーク起動(起動のたびに各値は変わる)

```sh
make start-local-network

# > Completed generating configuration:
# >         Log file: "/private/var/folders/2l/yq_nvwmd4rv14qnn4pswf68c0000gr/T/5640eb797a98f2826aa4cee5f40ece29/validator.log"
# >         Config path: "/private/var/folders/2l/yq_nvwmd4rv14qnn4pswf68c0000gr/T/5640eb797a98f2826aa4cee5f40ece29/0/node.yaml"
# >         Diem root key path: "/private/var/folders/2l/yq_nvwmd4rv14qnn4pswf68c0000gr/T/5640eb797a98f2826aa4cee5f40ece29/mint.key"
# >         Waypoint: 0:ca2c5616ea116c607c4132ba2ea77e64b58fa850d561f763d119f1945d926aa6
# >         JSON-RPC endpoint: 0.0.0.0:8080
# >         Stream-RPC enabled!
# >         FullNode network: /ip4/0.0.0.0/tcp/7180
# >         ChainId: TESTING
```

起動したローカルネットワークにCLIで接続
```sh
make start-local-cli ROOT_KEY=[起動時のDiem root key pathの値] WAYPOINT=[起動時のWaypointの値]
```

ログを出力
```sh
tail -f [起動時のLog fileの値]
```

# SDKでTestnetに接続

環境確認
```sh
python --version
# > Python 3.7.7

pipenv --version
# > pipenv, version 2021.5.29
```

sdkのサンプルリポジトリ取得
```sh
make clone-sdk
```

python sdk の example を全て実行
```sh
make run-python-sdk-examples
```

## 参照
- [My first transaction - Diem Developers](https://developers.diem.com/main/docs/tutorial-my-first-transaction)
- [Configure and run a public FullNode - Diem Developers](https://developers.diem.com/main/docs/configure-run-public-fullnode)
- [Run a local test validator network - Diem Developers](https://developers.diem.com/main/docs/tutorial-run-local-validator-nw)
- [My first client - Diem Developers](https://developers.diem.com/main/docs/tutorial-my-first-client)
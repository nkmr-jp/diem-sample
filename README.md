# diem-sample

See: https://developers.diem.com/main/docs/tutorial-my-first-transaction

## 起動

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
make start-cli-testnet
```

## Testnet の Fullnodeを起動

testnetのgenesisとwaypointファイル取得
```sh
make get-testnet-files
```

fullnode起動
```sh
make start-fullnode
```

fullnodeの設定ファイルのExampleを見る(public_full_node.yaml編集時の参考に)
```sh
make show-fullnode-config-example
```
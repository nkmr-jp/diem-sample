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

同期状況を確認する
```sh
make show-sync-state
> diem_state_sync_version{type="committed"} 1697861
> diem_state_sync_version{type="highest"} 2274720
> diem_state_sync_version{type="synced"} 1780861
> diem_state_sync_version{type="target"} 2274720
```
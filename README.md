# Nix Environment for pabotesu
## about
My Nix Environment

## composition
以下に各Nixの機能がどの範囲を対象に定義しているかを示します。

| Nixの機能 | 対象 |
| ---- | ---- |
| Nix Flakes | `hosts` 配下の定義されたホストに対して設定されていてほしい項目やサービス等の定義 |
| Home-Manager | ホストに存在する対象のユーザ上で設定されていてほしい項目やパッケージ・ツール等の定義 |
| Nix Shell | さまざまな開発環境の定義 |

## Hhosts and Users
ホストとユーザーの定義
| host_name | principal use |
| ---- | ---- |
| nix-machine | My Main Desktop Machine |
| thinkpad-x280 | My laptop Machine (※Verification Machine) |

| user_name | about |
| ---- | ---- |
| pabotesu | This is me |

## Usage

### 1st
- Clone This Repository（私の場合は`~/`配下に）
- Nix command & Flakes are Enabled

### Add Hardware Update
```
cp /etc/nixoshardware-configuration.nix ~/.dotfiles/hosts/$host_name/
```

### NixOS & Basic Nix setup for Any Host
```
cd ~/.dotfiles/
sudo nixos-rebuild switch --flake "./#$host_name"
reboot
```
### Setup `Environment for $user_name`
```
cd ~/.dotfiles/
nix run home-manager -- switch --flake "./#$user_name@$my_hosts_name"
```

*My Nix Environment? Why, It's right where I left it !!!*
![image](https://github.com/pabotesu/dotfiles/assets/35569302/b5da54ee-01ab-4b28-b864-aa86760ca4a9)

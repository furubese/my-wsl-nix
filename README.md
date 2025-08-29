# my-wsl-nix

WSL2 上で NixOS を使用したデスクトップ環境を構築するための設定リポジトリです。

## 概要

このプロジェクトは、Windows Subsystem for Linux 2 (WSL2) 上で NixOS を動作させ、Sway ウィンドウマネージャーをベースとしたグラフィカルな Linux デスクトップ環境を提供します。モジュール化された設定により、日本語入力、ディスプレイ設定、エディタ設定を統合管理しています。

## 特徴

- **WSL2 上の NixOS**: WSL2 環境でネイティブに動作する NixOS 設定
- **Sway ウィンドウマネージャー**: Wayland ベースの軽量ウィンドウマネージャー
- **日本語入力サポート**: Fcitx5 + Mozc による日本語入力環境
- **モジュラー構成**: 機能ごとに分離された再利用可能な設定
- **Home Manager 統合**: ユーザー環境の宣言的管理

## 構成

```
├── flake.nix                    # Nix Flakes エントリーポイント
├── configuration.nix            # システム設定
├── home.nix                     # Home Manager 設定
├── conf/
│   └── starship/
│       └── jetpack.toml         # Starship プロンプト設定
└── module/
    ├── display/                 # ディスプレイ・GUI 設定
    │   ├── display_configuration.nix
    │   ├── display_home.nix
    │   └── sway/
    │       └── config           # Sway ウィンドウマネージャー設定
    ├── editor/                  # エディタ設定
    │   ├── editor_configuration.nix
    │   └── editor_home.nix
    └── jpinput/                 # 日本語入力設定
        ├── jpinput_configuration.nix
        ├── jpinput_home.nix
        └── fcitx5/              # Fcitx5 設定ファイル
            ├── conf/
            ├── config
            └── profile
```

## インストール済みパッケージ

### システムパッケージ
- **基本ツール**: wget, vim, git, tmux
- **シェル**: zsh (Oh My Zsh 統合)
- **日本語入力**: fcitx5, fcitx5-mozc-ut

### デスクトップ環境
- **ウィンドウマネージャー**: Sway
- **ターミナル**: Kitty (透過効果、カスタムテーマ)
- **ブラウザ**: Firefox
- **フォント**: Hack Nerd Font, Noto Fonts
- **スクリーンショット**: grim, slurp
- **通知**: mako

### 開発環境
- **エディタ**: Neovim
- **セキュリティ**: gnome-keyring

## 使用方法

### 前提条件
- Windows 10/11 with WSL2
- WSL2 で NixOS-WSL がインストール済み

### セットアップ

1. リポジトリをクローン
```bash
git clone <this-repository>
cd my-wsl-nix
```

2. NixOS 設定を適用
```bash
sudo nixos-rebuild switch --flake .#nixos
```

3. Sway を起動
```bash
sway
```

### キーバインド (Sway)

- **Mod キー**: Alt
- **ターミナル**: Alt + Return
- **アプリランチャー**: Alt + d
- **ウィンドウを閉じる**: Alt + Shift + q
- **設定リロード**: Alt + Shift + c
- **フォーカス移動**: Alt + h/j/k/l
- **ウィンドウ移動**: Alt + Shift + h/j/k/l
- **ワークスペース切り替え**: Alt + 1-0
- **スクリーンショット**: Print キー

## 設定のカスタマイズ

### 日本語入力
- タイムゾーン: Asia/Tokyo
- ロケール: ja_JP.UTF-8
- 入力メソッド: Fcitx5 + Mozc (辞書拡張版)

### ターミナル (Kitty)
- 背景透過度: 90%
- カラーテーマ: Catppuccin 風
- 日本語フォント対応

### Sway ウィンドウマネージャー
- JIS キーボード対応
- Vim ライクなキーバインド
- ステータスバー付き

## VS Code 連携

Windows 側の VS Code から WSL 環境へのアクセスが可能です：
```bash
code  # Windows VS Code を起動するエイリアス
```

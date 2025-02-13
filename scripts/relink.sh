#!/bin/bash

# スクリプトの場所に関係なく実行できるように、プロジェクトルートへ移動
cd "$(dirname "$0")/.." || exit

# 色付きの出力用の変数
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo "シンボリックリンクの再作成を開始します..."

# blogディレクトリに移動
cd data/blog || {
    echo -e "${RED}blogディレクトリへの移動に失敗しました${NC}"
    exit 1
}

# 絶対パスを取得
CURRENT_DIR=$(pwd)
SOURCE_DIR=$(cd ../../my-log/blog/jp && pwd)

# 既存のシンボリックリンクを削除
echo "既存のシンボリックリンクを削除中..."
find . -type l -delete

# 新しいシンボリックリンクを作成
echo "新しいシンボリックリンクを作成中..."
if cp -rs "$SOURCE_DIR/." .; then
    echo -e "${GREEN}シンボリックリンクの再作成が完了しました${NC}"
else
    echo -e "${RED}シンボリックリンクの作成中にエラーが発生しました${NC}"
    exit 1
fi

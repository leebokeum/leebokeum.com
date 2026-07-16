#!/bin/bash
# 백업 upload에서 이미지 확장자만 화이트리스트 방식으로 복사한다.
# (.jsp 등 업로드 취약점으로 들어온 위험 파일 차단 목적)
set -euo pipefail

SRC="/Users/user/Downloads/20260124/upload/upload"
DEST="public/images"

mkdir -p "$DEST"
find "$SRC" -maxdepth 1 -type f \
    \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.gif' -o -iname '*.webp' -o -iname '*.bmp' \) \
    -exec cp {} "$DEST"/ \;

# 본문이 참조하는 파일 첨부 2건만 선별 복사
mkdir -p public/file
cp "$SRC/41cafe4bda2c4fb68a5b45800ce28f8a.txt" public/file/ 2>/dev/null || true
cp "$SRC/6890f30efa0942b8859ec82cc195d94b.gz" public/file/ 2>/dev/null || true

echo "images: $(ls "$DEST" | wc -l), file: $(ls public/file | wc -l)"

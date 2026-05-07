#!/bin/bash

echo ">>> 1. 編譯 MkDocs 研究筆記..."
# 這會讀取 docs/ 的內容，並生成靜態網頁到 notes/ 中
mkdocs build

echo ">>> 2. 將所有變更加入版本控制..."
git add .

read -p "請輸入本次更新描述 (例如 'update notes'): " msg
git commit -m "$msg"

echo ">>> 3. 推送至 GitHub..."
git push origin main

echo ">>> 部署完成！請等待約 1-2 分鐘後重新整理網頁。"
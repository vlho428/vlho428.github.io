#!/bin/bash
echo "--- 開始部署至 GitHub ---"
git add .
read -p "請輸入本次更新描述: " msg
git commit -m "$msg"
git push origin main
echo "--- 部署完成！請等待 1 分鐘後查看網頁 ---"
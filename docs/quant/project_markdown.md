# 🚀 AI Quant Lab 混合式專案開發全紀錄

本專案採用 **「自定義科技感門面 + MkDocs 專業知識庫」** 的架構。將個人品牌的感官衝擊（前端）與硬核研究的邏輯管理（筆記）完美結合。

---

## 📂 1. 專案目錄結構 (Project Structure)

```text
MY-PORTFOLIO/ (根目錄)
├── index.html          # 炫酷門面：AI 粒子網絡與量化指標展示
├── style.css           # 門面樣式：機構級 Glassmorphism 質感
├── script.js           # 門面特效：Canvas 動態粒子連線引擎
├── deploy.sh           # 自動化腳本：一鍵編譯並推送至 GitHub
├── mkdocs.yml          # MkDocs 核心配置文件
├── .nojekyll           # 關鍵檔案：告知 GitHub 停用 Jekyll 解析
├── PROJECT_GUIDE.md    # 本開發指南檔案 (即本檔案)
├── docs/               # 筆記原始碼 (Markdown)
│   ├── index.md        # 筆記庫首頁
│   ├── stylesheets/    # MkDocs 客製化樣式 (extra.css)
│   └── javascripts/    # MkDocs 插件腳本 (mathjax.js)
└── notes/              # 編譯後產出的 HTML (子目錄，由腳本自動更新)
```

---

## 🛠 2. 核心配置文件 (`mkdocs.yml`)

這是讓 MkDocs 具備官方高級質感並嵌入子路徑的關鍵設定。

```yaml
site_name: AQR_LAB 研究筆記
site_dir: notes              # 將輸出目錄設定在 notes/

theme:
  name: material
  font:
    text: Roboto
    code: Roboto Mono
  features:
    - navigation.tabs          # 頂部導航標籤
    - navigation.sections      # 左側目錄區塊化
    - toc.integrate            # 目錄整合
    - navigation.top           # 回到頂部按鈕
    - content.code.copy        # 程式碼複製按鈕
  palette:
    - media: "(prefers-color-scheme: light)"
      scheme: default
      primary: indigo
      toggle:
        icon: material/brightness-7
        name: 切換至深色模式
    - media: "(prefers-color-scheme: dark)"
      scheme: slate
      primary: indigo
      toggle:
        icon: material/brightness-4
        name: 切換至淺色模式

markdown_extensions:
  - admonition
  - pymdownx.details
  - pymdownx.superfences
  - pymdownx.arithmatex:
      generic: true
  - pymdownx.tabbed:
      alternate_style: true
  - attr_list

extra_javascript:
  - javascripts/mathjax.js
  - https://cdnjs.cloudflare.com/ajax/libs/mathjax/3.2.2/es5/tex-mml-chtml.js

extra_css:
  - stylesheets/extra.css
```

---

## 🎨 3. 樣式與功能美化 (Customization)

### 中文排版與自適應優化 (`extra.css`)
使用了 CSS 變數（Variables）以支援日夜模式切換，並針對中文閱讀（Inter, Noto Sans TC）優化。

*   **行距**：1.7 (提升閱讀舒適度)。
*   **公式美化**：增加左側色條標示，並支援自動變色。
*   **網格卡片**：支援 `.grid` 與 `.card` 類別，用於製作導覽入口。

### 數學公式渲染 (`mathjax.js`)
確保 LaTeX 語法如 `$$ IR = \frac{\alpha}{\omega} $$` 能正確渲染為學術級方程式。

---

## 🚢 4. 自動化發布流程 (Deployment)

為避免路徑錯誤與重複輸入指令，使用 `deploy.sh` 進行自動化。

**執行方式：**
```bash
./deploy.sh
```

**腳本邏輯：**
1. 執行 `mkdocs build` 將 Markdown 轉為 HTML 至 `/notes`。
2. `git add .` 將所有變更（含門面與筆記）加入緩存。
3. `git commit` 提交版本紀錄。
4. `git push` 推送至 GitHub Pages。

---

## 💡 5. 寫作指南 (Writing Tips)

### 💡 資訊方塊 (Admonitions)
```markdown
!!! info "研究備註"
    這是在回測 MSCI Taiwan 指數時的重要發現。
```

### 🗂️ 程式碼分頁 (Tabs)
```markdown
=== "Python"
    ```python
    print("AI Quant Lab")
    ```
=== "SQL"
    ```sql
    SELECT * FROM stocks;
    ```
```

### 🔗 官方風格按鈕 (Buttons)
```markdown
[進入文件 ➔](./path/to/page.md){: .md-button .md-button--primary }
```

---

## ⚠️ 常見問題排除 (FAQ)

*   **公式顯示不全**：檢查 `mathjax.js` 是否已放入 `docs/javascripts/` 資料夾，且 `mkdocs.yml` 已引用。
*   **GitHub Pages 破圖或樣式遺失**：確認根目錄有 `.nojekyll` 檔案。
*   **本地預覽正常但上傳後壞掉**：檢查檔案命名是否包含大寫字母（Linux 系統區分大小寫）。
*   **KeyError: 'theme'**：在 `mkdocs.yml` 中，`pymdownx.highlight` 擴充套件下不可重複設定 `theme: material`。
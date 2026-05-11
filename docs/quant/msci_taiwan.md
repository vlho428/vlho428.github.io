# MSCI 策略回測

這是一篇關於 Barra 10 因子模型的推導與 Qlib 實作細節的文件。
# 測試MD檔

目前專注於 MSCI Taiwan Index 增強策略與 10 Barra 風格因子模型整合。
進入左側選單查看完整回測紀錄與 Python 實作片段。



### 資訊比率 (Information Ratio, IR)

在評估 Barra 因子表現時，我們使用資訊比率來衡量主動報酬的穩定性。公式如下：

$$
IR = \frac{E[R_p - R_b]}{\sigma(R_p - R_b)} = \frac{\alpha}{\omega}
$$

其中 $\alpha$ 代表主動預期報酬，$\omega$ 代表追蹤誤差 (Tracking Error)。









### 獲取台股價量特徵

=== "Python (Qlib API)"
    ```python
    import qlib
    from qlib.data import D

    # 讀取 MSCI Taiwan 成分股
    features = D.features('MSCI_TW', ['$close', '$volume'], start_time='2025-01-01')
    print(features.head())
    ```

=== "SQL (MySQL WSL2)"
    ```sql
    -- 從本地資料庫直接查詢
    SELECT trade_date, ticker, close, volume 
    FROM market_data 
    WHERE index_name = 'MSCI_TW' AND trade_date >= '2025-01-01';
    ```









!!! warning "版本兼容性注意"
    在使用 PyTorch 進行神經網路訓練時，請確保安裝的驅動版本與 **CUDA 12.9** 完全對應，否則可能發生 WSL 內核橋接失敗。

!!! failure "策略失效紀錄"
    在測試中發現，單純依賴「規模因子 (Size)」在近期的台股市場中會產生嚴重的回撤，需導入動量因子進行對沖。
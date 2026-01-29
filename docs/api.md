# 画面・URL設計

## 一般ユーザー

### 商品一覧
- URL: /users/:user_id/items
- Method: GET
- 説明: 商品一覧を表示する

### 購入
- URL: /users/:user_id/purchases
- Method: POST
- 成功: 購入完了メッセージ
- 失敗: 残高不足 or 在庫不足

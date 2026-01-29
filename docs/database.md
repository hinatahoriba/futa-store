### テーブル一覧

### items (商品テーブル)

| カラム名 | 型 | 制約 | 説明 |
| --- | --- | --- | --- |
| id | INTEGER | PK | 商品ID |
| name | VARCHAR(100) | NOT NULL | 商品名 |
| created_at | TIMESTAMP | NOT NULL | 作成日時 |
| updated_at | TIMESTAMP | NOT NULL | 更新日時 |

### users (利用者テーブル)

| カラム名 | 型 | 制約 | 説明 |
| --- | --- | --- | --- |
| id | INTEGER | PK | ユーザーID |
| student_id | VARCHAR(100) | NOT NULL, UNIQUE | 学生番号 |
| name | VARCHAR(100) | NOT NULL | ユーザー名 |
| balance | INTEGER | NOT NULL | 現在残高 |
| created_at | TIMESTAMP | NOT NULL | 作成日時 |
| updated_at | TIMESTAMP | NOT NULL | 更新日時 |

### user_balances (入出金履歴テーブル)

| カラム名 | 型 | 制約 | 説明 |
| --- | --- | --- | --- |
| id | INTEGER | PK | 履歴ID |
| user_id | INTEGER | FK → users.id | ユーザーID |
| value | INTEGER | NOT NULL | 金額(正負で入出金を表現) |
| balance_type | ENUM('income', 'outcome') | NOT NULL | 入出金種別 |
| created_at | TIMESTAMP | NOT NULL | 作成日時 |
| updated_at | TIMESTAMP | NOT NULL | 更新日時 |

### user_items (購入履歴テーブル)

| カラム名 | 型 | 制約 | 説明 |
| --- | --- | --- | --- |
| id | INTEGER | PK | 購入履歴ID |
| item_id | INTEGER | FK → items.id | 商品ID |
| user_id | INTEGER | FK → users.id | ユーザーID |
| price_id | INTEGER | FK → prices.id | 価格ID |
| quantity | INTEGER | NOT NULL | 購入数量 |
| created_at | TIMESTAMP | NOT NULL | 購入日時 |
| updated_at | TIMESTAMP | NOT NULL | 更新日時 |

### supplements (補填履歴テーブル)

| カラム名 | 型 | 制約 | 説明 |
| --- | --- | --- | --- |
| id | INTEGER | PK | 補填履歴ID |
| item_id | INTEGER | FK → items.id | 商品ID |
| quantity | INTEGER | NOT NULL | 補填数量 |
| created_at | TIMESTAMP | NOT NULL | 補填日時 |
| updated_at | TIMESTAMP | NOT NULL | 更新日時 |

### prices (商品価格履歴テーブル)

| カラム名 | 型 | 制約 | 説明 |
| --- | --- | --- | --- |
| id | INTEGER | PK | 価格ID |
| item_id | INTEGER | FK → items.id | 商品ID |
| price | INTEGER | NOT NULL | 価格 |
| created_at | TIMESTAMP | NOT NULL | 設定日時 |
| updated_at | TIMESTAMP | NOT NULL | 更新日時 |
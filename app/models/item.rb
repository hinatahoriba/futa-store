class Item < ApplicationRecord
  has_many :prices, dependent: :destroy
  has_many :user_items, dependent: :destroy
  has_many :supplements, dependent: :destroy

  validates :name, presence: true, length: { maximum: 100 }

  # 最新の価格を取得
  def current_price
    prices.order(created_at: :desc).first
  end

  # 在庫数を計算（補填数合計 - 購入数合計）
  def stock_quantity
    supplements.sum(:quantity) - user_items.sum(:quantity)
  end
end

class Item < ApplicationRecord
  has_many :prices, dependent: :destroy
  has_many :user_items, dependent: :destroy
  has_many :supplements, dependent: :destroy

  validates :name, presence: true, length: { maximum: 100 }

  # 最新の価格を取得
  def current_price
    prices.order(created_at: :desc).first
  end
end

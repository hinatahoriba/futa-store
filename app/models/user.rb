class User < ApplicationRecord
  has_many :user_balances, dependent: :destroy
  has_many :user_items, dependent: :destroy

  validates :student_id, presence: true, uniqueness: true, length: { maximum: 100 }
  validates :name, presence: true, length: { maximum: 100 }
  validates :balance, presence: true
end

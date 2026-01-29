class UserItem < ApplicationRecord
  belongs_to :item
  belongs_to :user
  belongs_to :price

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
end

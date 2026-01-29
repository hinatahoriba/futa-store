class UserBalance < ApplicationRecord
  belongs_to :user

  enum :balance_type, { income: 0, outcome: 1 }

  validates :value, presence: true, numericality: { only_integer: true }
  validates :balance_type, presence: true
end

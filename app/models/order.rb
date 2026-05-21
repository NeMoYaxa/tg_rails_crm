class Order < ApplicationRecord
  belongs_to :telegram_user

  has_many :order_items
  has_many :products, through: :order_items

  enum :status, {
    assigned: "assigned",
    in_progress: "in_progress",
    completed: "completed"
  }, validate: true

  validates :total_price, numericality: { greater_than: 0 }
  validates :status, presence: true
end

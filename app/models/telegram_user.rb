class TelegramUser < ApplicationRecord
  has_many :bot_logs
  has_many :orders

  validates :telegram_id, presence: true, uniqueness: true
  validates :first_name, presence: true
end

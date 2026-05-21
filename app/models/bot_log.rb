class BotLog < ApplicationRecord
  belongs_to :telegram_user

  validates :message_text, presence: true
end

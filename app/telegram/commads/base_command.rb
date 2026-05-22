class BaseCommand
  attr_reader :payload

  def initialize(payload)
    @payload = payload
  end

  def call
    raise NotImplementedError, "Метод call не определен"
  end

  protected

  def telegram_id
    payload.from.id
  end

  def current_user
    @current_user ||= TelegramUser.find_or_create_by!(telegram_id: telegram_id) do |u|
      u.username = payload.from.username
      u.first_name = payload.from.first_name
    end
  end

  def respond_with(text:, reply_markup: nil)
    BotClient.send_message(
      chat_id: payload.chat.id,
      text: text,
      reply_markup: reply_markup)
  end
end

module Telegram
  class Router
    def self.route(payload)
      text = payload.text

      case text
      when "/start"
        StartCommand.new(payload).call
      when "help"
        HelpCommand.new(payload).call
      when "🛍️ Сделать заказ", "📦 Мои заказы"
        OrderCommand.new(payload).call
      else
        respond_with_unknown_command(payload)
      end
    end

    private

    def self.respond_with_unknown_command(payload)
      BotClient.send_message(
        chat_id: payload.chat.id,
        text: "У меня нет такой команды, воспользуйтесь кнопками меню",
        reply_markup: Ui::Keyboards.main_menu)
    end
  end
end
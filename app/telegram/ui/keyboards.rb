module Telegram
  module Ui
    class Keyboards
      def self.main_menu
        {
          keyboard: [
            [
              { text: "🛍️ Сделать заказ" },
              { text: "📦 Мои заказы" }
            ],
            [
              { text: "ℹ️ Помощь" }
            ]
          ],
          resize_keyboard: true,
          one_time_keyboard: true
        }
      end

      def self.back_to_menu
        {
          keyboard: [
            { text: "⬅️ Вернуться в меню" }
          ],
          resize_keyboard: true,
          one_time_keyboard: true
        }
      end
    end
  end
end

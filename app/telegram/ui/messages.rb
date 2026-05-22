module Telegram
  module Ui
    class Messages
      def self.welcome(first_name)
        <<~TEXT
          👋 Привет, #{first_name}!

          Добро пожаловать в наш магазин. Выберите интересующий вас раздел в меню ниже:
        TEXT
      end

      def self.help_info
        <<~TEXT
          ℹ️ Это бот для заказа товаров.

          Используйте меню для навигации.
        TEXT
      end

      def self.orders_list(orders)
        return "📦 У вас пока нет заказов. Самое время что-нибудь выбрать!" if orders.empty?

        orders_string = orders.map.with_index do |order, index|
          date = order.created_at.strftime('%d.%m.%Y')

          "#{index + 1}. 🛍️ Заказ №#{order.id} от #{date}\n" \
            "  🏷️ Статус: #{order.status}_\n" \
            "  💲 Сумма: #{order.total_price} руб."
        end
        formatted_orders = orders_string.join("\n\n")

        <<~TEXT
          📋 Ваши последние заказы:

          #{formatted_orders}
          
          Выберите нужный раздел в меню ниже 👇
        TEXT
      end
    end
  end
end

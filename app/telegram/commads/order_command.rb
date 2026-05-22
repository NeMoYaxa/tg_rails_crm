class OrderCommand < BaseCommand
  BUTTON_ACTIONS = {
    "🛍️ Сделать заказ" => :create_new_order,
    "📦 Мои заказы" => :show_user_orders,
  }

  def call
    action_method = BUTTON_ACTIONS[payload.text]

    if action_method
      send(create_new_order)
    else
      respond_with(text: "Данной команды не существует")
    end
  end

  private

  def create_new_order

  end

  def show_user_orders
    orders = current_user.orders

    text = Telegram::Ui::Messages.orders_list(orders)
    respond_with(text: text)
  end
end
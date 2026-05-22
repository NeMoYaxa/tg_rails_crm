class StartCommand < BaseCommand
  def call
    user = current_user

    text = Telegram::Ui::Messages.welcome(user.first_name)
    reply_markup = Telegram::Ui::Keyboards.main_menu

    respond_with(text: text, reply_markup: reply_markup)
  end
end

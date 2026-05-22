class HelpCommand < BaseCommand
  def call
    text = Telegram::Ui::Messages.help_info
    reply_markup = Telegram::Ui::Keyboards.back_to_menu

    respond_with(text: text, reply_markup: reply_markup)
  end
end

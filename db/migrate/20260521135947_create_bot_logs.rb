class CreateBotLogs < ActiveRecord::Migration[8.1]
  def change
    create_table :bot_logs do |t|
      t.references :telegram_user, null: false, foreign_key: true
      t.text :message_text, null: false

      t.timestamps
    end
  end
end

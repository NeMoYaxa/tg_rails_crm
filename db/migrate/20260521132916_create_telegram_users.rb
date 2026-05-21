class CreateTelegramUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :telegram_users do |t|
      t.bigint :telegram_id, null: false, index: { unique: true }
      t.string :username
      t.string :first_name, null: false
      t.string :step

      t.timestamps
    end
  end
end

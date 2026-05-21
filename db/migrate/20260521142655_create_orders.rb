class CreateOrders < ActiveRecord::Migration[8.1]
  def change
    create_table :orders do |t|
      t.references :telegram_user, null: false, foreign_key: true
      t.string :status, null: false
      t.decimal :total_price, precision: 10, scale: 2, null: false

      t.timestamps

      t.check_constraint "total_price > 0", name: "total_price_positive"
    end
  end
end

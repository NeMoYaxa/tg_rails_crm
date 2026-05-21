class CreateProducts < ActiveRecord::Migration[8.1]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.decimal :price, precision: 10, scale: 2, null: false

      t.timestamps

      t.check_constraint "price > 0", name: "price_positive"
    end
  end
end

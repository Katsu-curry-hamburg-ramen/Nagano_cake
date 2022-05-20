class CreateOrdersItems < ActiveRecord::Migration[6.1]
  def change
    create_table :orders_items do |t|
      t.integer :customer_id
      t.integer :item_id
      t.integer :quanitity
      t.integer :status
      t.integer :total_payment
      t.timestamps
    end
  end
end

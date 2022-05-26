class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|

      t.integer :customer_id
      t.integer :item_id
      t.integer :quantity
      t.integer :status, default: "0"
      t.integer :total_payment

      t.timestamps
    end
  end
end

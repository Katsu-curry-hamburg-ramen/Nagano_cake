class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  belongs_to :user
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: {}　#注文ステータス
  
  
  
end

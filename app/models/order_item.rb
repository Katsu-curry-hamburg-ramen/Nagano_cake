class OrderItem < ApplicationRecord
  # 注文ステータス（0=着手不可 / 1=製作待ち / 2=製作中 / 3=製作完了）
  enum status: {impossible:0, wait:1, midst:2, completion:3}

  belongs_to :order
  belongs_to :item
  
  def subtotal
    item.add_tax_price * quantity
  end

end
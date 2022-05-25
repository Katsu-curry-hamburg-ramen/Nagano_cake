class CartItem < ApplicationRecord
    def subtotal
        item.with_tax_price * quantity
    end
end

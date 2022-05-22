class Item < ApplicationRecord
    validates :validation, inclusion:{in: [true, false]}
    has_one_attached :product_image
end

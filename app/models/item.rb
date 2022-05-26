class Item < ApplicationRecord
    has_many :cart_items, dependent: :destroy
    has_many :order_item, dependent: :destroy
    belongs_to :genre
    has_many :cart_items, dependent: :destroy
    with_options presence: true do
      validates :name, uniqueness: true
      validates :body
      validates :genre_id
      validates :price
    end
    validates :is_active, inclusion:{in: [true, false]}
    has_one_attached :product_image
    
    def get_product_image(width, height)
      unless product_image.attached?
        file_path = Rails.root.join('app/assets/images/no_image.jpeg')
        product_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
      end
      product_image.variant(resize_to_limit: [width, height]).processed
    end
    def add_tax_price
        (self.price * 1.10).round
    end
end

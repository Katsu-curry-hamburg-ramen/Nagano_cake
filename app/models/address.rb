class Address < ApplicationRecord
  
  belongs_to :costomer
  
  validates :name, presence: true
  validates :post_code, presence: true
  validates :address, presence: true

  def address_display
    '〒' + post_code + ' ' + address + ' ' + name
  end
end

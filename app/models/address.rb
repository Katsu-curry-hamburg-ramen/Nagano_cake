class Address < ApplicationRecord

  belongs_to :customer

  validates :name, presence: true
  validates :postcode, presence: true
  validates :address, presence: true




  def  address_display
    '〒'  +  postcode  +  ' '  +  address  +  ' '  +  name
  
  end
end

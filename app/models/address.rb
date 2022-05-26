class Address < ApplicationRecord

  belongs_to :customer



  def address_display
    '〒' + posta_code + ' ' + address + ' ' + name
  end
end

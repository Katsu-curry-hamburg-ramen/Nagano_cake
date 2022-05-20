class Item < ApplicationRecord
    validates :validation, inclusion:{in: [true, false]}
end

class Cart < ApplicationRecord
  has_many :line_items,dependent: :destroy
  has_many :images, through: :line_items
end

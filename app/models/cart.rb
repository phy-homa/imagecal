class Cart < ApplicationRecord
  has_many :images, through: :line_items
  has_many :line_items,dependent: :destroy


end

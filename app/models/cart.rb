class Cart < ApplicationRecord
  has_many :line_items,dependent: :destroy
  has_many :images, through: :line_items
  belongs_to :image_order
  belongs_to :order, through: :image_order
end

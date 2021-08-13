class Cart < ApplicationRecord
  has_many :line_items,dependent: :destroy
  has_many :images, through: :line_items, dependent: :destroy
  belongs_to :image_order
  has_one :order, through: :image_order
end

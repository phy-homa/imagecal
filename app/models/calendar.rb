class Calendar < ApplicationRecord
  belongs_to :image_order
  belongs_to :cart, through: :image_order
  has_many :images, through: :image_order
  belongs_to :order
end

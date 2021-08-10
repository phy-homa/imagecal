class Cart < ApplicationRecord
  has_many :line_items,dependent: :destroy
  belongs_to :calendar, through: :line_items
  has_many :images, through: :line_items
end
